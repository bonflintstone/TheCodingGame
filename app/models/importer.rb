class Importer
  def initialize(config_file)
    @game_config = JSON
      .parse(File.read(config_file))
      .nested_under_indifferent_access[:game]
  end

  def load
    [GameConfig, Level, Step, Question, Answer]
      .map(&:destroy_all)

    load_config
    load_data
  end

  def load_config
    GameConfig::KEYS.each do |key|
      GameConfig.create(key: key, value: @game_config[key.camelcase(:lower)])
    end
  end

  def load_data
    @game_config.fetch(:levels, []).each do |level|
      dbLevel = Level.create!(
        identifier: level[:id],
        level_intro_message: level[:levelIntroMessage],
        level_conclusion_message: level[:levelConclusionMessage],
        show_score_conclusion_level: level[:showScoreConclusionLevel],
        next_level: level[:nextLevel]
      )

      level.fetch(:steps, []).each do |step|
        dbStep = Step.create!(
          identifier: step[:id],
          level: dbLevel,
          file1_name: step[:file1][:label],
          file1_content: read_file('./app/models/answer.rb'),
          file1_clarification: step[:file1][:path],
          file2_name: step[:file2][:label],
          file2_content: read_file('./app/models/question.rb'),
          file2_clarification: step[:file2][:path]
        )

        step.fetch(:questions, []).each do |question|
          dbQuestion = Question.create!(
            step: dbStep,
            text: question[:question],
            correct_answer: question[:correctAnswer]
          )

          question.fetch(:answers, []).each do |answer|
            Answer.create!(
              text: answer[:text],
              points: answer[:points],
              question: dbQuestion
            )
          end
        end
      end
    end
  end

  def read_file(path)
    File.read(path)
  end
end
