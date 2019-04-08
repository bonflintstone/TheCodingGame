json.status do
  json.gameIntroMessage GameConfig.get(:game_intro_message)
  json.gameConclusionMessage GameConfig.get(:game_conclusion_message)
  json.showScoreConclusionGame GameConfig.get(:show_score_conclusion_game)
  json.levelStatus current_user.level_status

  json.currentLevel do
    json.name current_user.level_todo&.identifier
    json.id current_user.level_todo&.identifier
  end
end
