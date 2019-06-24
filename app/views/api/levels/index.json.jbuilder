json.levels @levels.order(order: :asc).each do |level|
  json.identifier level.identifier
  json.level_intro_message level.level_intro_message
  json.level_conclusion_message level.level_conclusion_message
  json.show_score_conclusion_level level.show_score_conclusion_level
end
