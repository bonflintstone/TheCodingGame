class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :results

  # The last level anything was done on
  def current_level
    results.all.map(&:level).max(&:order)
  end

  # The first level with unanswered questions
  def level_todo
    return Level.first_level unless current_level
    return current_level unless has_finished? current_level

    current_level.next
  end

  def level_status
    return "new" if current_level.nil? && level_todo.present?
    return "finished" if current_level.present? && level_todo.nil?
    return "inLevel" if current_level == level_todo
    return "betweenLevels" if current_level != level_todo
  end

  def has_finished?(level)
    level.questions.to_a.all? do |question|
      results.any? { |result| result.question.id == question.id }
    end
  end
end
