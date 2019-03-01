json.levels @levels do |level|
  json.identifier level.identifier
  json.level_intro_message level.level_intro_message
  json.game_conclusion_message level.game_conclusion_message
  json.show_score_conclusion_level level.show_score_conclusion_level
  json.next_leves level.next_level
end
