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
        game_conclusion_message: level[:gameConclusionMessage],
        show_score_conclusion_level: level[:showScoreConclusionLevel],
        next_level: level[:nextLevel]
      )

      level.fetch(:steps, []).each do |step|
        dbStep = Step.create!(
          identifier: step[:id],
          level: dbLevel,
          file1_name: step[:file1][:path],
          file1_content: step[:file1][:path],
          file1_clarification: step[:file1][:clarificationUrl],
          file2_name: step[:file2][:path],
          file2_content: step[:file2][:path],
          file2_clarification: step[:file2][:clarificationUrl],
        )

        step.fetch(:questions, []).each do |question|
          dbQuestion = Question.create!(
            step: dbStep,
            text: question[:text],
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
end
