class GameConfig < ApplicationRecord
  KEYS = %w[
    game_name game_intro_message game_conclusion_message show_score_conclusion_game game_name
  ].freeze

  def self.get(key)
    find_by(key: key)&.value
  end
end
