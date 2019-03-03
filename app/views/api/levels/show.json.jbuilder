json.level do
  json.identifier @level.identifier
  json.level_intro_message @level.level_intro_message
  json.level_conclusion_message @level.level_conclusion_message
  json.show_score_conclusion_level @level.show_score_conclusion_level
  json.next_level @level.next_level

  json.steps @level.steps do |step|
    json.identifier step.identifier
    json.file1_name step.file1_name
    json.file1_content step.file1_content
    json.file1_clarification step.file1_clarification
    json.file2_name step.file2_name
    json.file2_content step.file2_content
    json.file2_clarification step.file2_clarification
    
    json.questions step.questions do |question|
      json.text question.text

      json.answers question.answers do |answer|
        json.text answer.text
      end
    end
  end
end
