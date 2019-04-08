class Level < ApplicationRecord
  has_many :steps
  has_many :questions, through: :steps

  def self.first_level
    Level.order(:order).first
  end

  def next
    Level.find_by(order: order + 1)
  end
end
