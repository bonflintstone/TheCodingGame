class Question < ApplicationRecord
  belongs_to :step
  has_one :level, through: Step
  has_many :answers

  delegate :level, to: :step
end
