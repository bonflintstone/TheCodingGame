class Importer
  def initialize(config_file)
    @game_config = JSON
      .parse(File.read(config_file))
      .nested_under_indifferent_access[:game]
  end

  def load
    [GameConfig, Level, Step, Question, Answer]
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
    @game_config.fetch(:levels, []).each do |level|
      dbLevel = Level.create!(
        identifier: level[:id],
        level_intro_message: level[:levelIntroMessage],
        level_conclusion_message: level[:levelConclusionMessage],
        show_score_conclusion_level: level[:showScoreConclusionLevel],
        next_level: level[:nextLevel]
      )

      import_steps(level, dbLevel)
    end
  end

  def import_steps(level, dbLevel)
    level.fetch(:steps, []).each do |step|
      dbStep = Step.create!(
        identifier: step[:id],
        level: dbLevel,
        file1_name: step[:file1][:label],
        file1_content: File.read('./app/models/answer.rb'),
        file1_clarification: step[:file1][:path],
        file2_name: step[:file2][:label],
        file2_content: File.read('./app/models/question.rb'),
        file2_clarification: step[:file2][:path]
      )

      import_questions(step, dbStep)
    end
  end

  def import_questions(step, dbStep)
    step.fetch(:questions, []).each do |question|
      dbQuestion = Question.create!(
        step: dbStep,
        text: question[:question],
        correct_answer: question[:correctAnswer]
      )

      import_answers(question, dbQuestion)
    end
  end

  def import_answers(question, dbQuestion)
    question.fetch(:answers, []).each do |answer|
      Answer.create!(
        text: answer[:text],
        points: answer[:points],
        question: dbQuestion
      )
    end
  end
end
