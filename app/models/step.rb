class Step < ApplicationRecord
  belongs_to :level
  has_many :questions

  def self.first_step
    where(order: 0, level_id: Level.first_level.id).first
  end

  def next
    level.steps.find { |s| s.order == order + 1 } ||
      level.next&.steps&.find { |s| s.order == 0 }
  end
end
