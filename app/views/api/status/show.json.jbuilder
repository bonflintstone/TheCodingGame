json.status do
  json.gameIntroMessage GameConfig.get(:game_intro_message)
  json.gameConclusionMessage GameConfig.get(:game_conclusion_message)
  json.showScoreConclusionGame GameConfig.get(:show_score_conclusion_game)

  json.levelNumber current_user.level&.order
  json.levelIdentifier (current_user.level || Level.first_level).identifier
  json.stepNumber current_user.step&.order
  json.finished current_user.finished?
end
