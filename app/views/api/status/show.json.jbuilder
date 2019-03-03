json.status do
  json.gameIntroMessage GameConfig.get(:game_intro_message)
  json.gameConclusionMessage GameConfig.get(:game_conclusion_message)
  json.showScoreConclusionGame GameConfig.get(:show_score_conclusion_game)
  json.currentLevel Level.first.identifier
end
