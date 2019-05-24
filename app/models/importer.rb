class Importer
  def initialize(config_zip)
    @zip_file = ::Zip::File.open(config_zip)

    @game_config = JSON.parse(read_file('config.json'))
                       .nested_under_indifferent_access[:game]
  end

  def read_file(path)
    file = @zip_file.find_entry(path)

    Rails.logger.error("Could not find #{path} in zip file") if file.blank?

    file.get_input_stream.read
  end

  def load
    [GameConfig, Level, Step, Question, Answer, User, Result]
      .map(&:destroy_all)

    import_users
    import_config
    import_game
  end

  def import_users
    @game_config[:predefinedUsers].each do |user|
      User
        .find_or_create_by(email: user[:username])
        .update(password: user[:password])
    end
  end

  def import_config
    GameConfig::KEYS.each do |key|
      GameConfig.create(key: key, value: @game_config[key.camelcase(:lower)])
    end
  end

  def import_game
    @game_config.fetch(:levels, []).each_with_index do |level, index|
      db_level = Level.create!(
        identifier: level[:id],
        order: index,
        level_intro_message: level[:levelIntroMessage],
        level_conclusion_message: level[:levelConclusionMessage],
        show_score_conclusion_level: level[:showScoreConclusionLevel],
        next_level: level[:nextLevel]
      )

      import_steps(level, db_level)
    end
  end

  def import_steps(level, db_level)
    level.fetch(:steps, []).each_with_index do |step, index|
      db_step = Step.create!(
        identifier: step[:id],
        order: index,
        level: db_level,
        file1_name: step[:file1][:label],
        file1_content: read_file(step[:file1][:path]),
        file1_clarification: step[:file1][:clarificationUrl],
        file2_name: step[:file2][:label],
        file2_content: read_file(step[:file2][:path]),
        file2_clarification: step[:file2][:clarificationUrl]
      )

      import_questions(step, db_step)
    end
  end

  def import_questions(step, db_step)
    step.fetch(:questions, []).each_with_index do |question, index|
      db_question = Question.create!(
        step: db_step,
        order: index,
        text: question[:question],
        correct_answer: question[:correctAnswer]
      )

      import_answers(question, db_question)
    end
  end

  def import_answers(question, db_question)
    question.fetch(:answers, []).each do |answer|
      Answer.create!(
        text: answer[:text],
        points: answer[:points],
        question: db_question
      )
    end
  end
end
