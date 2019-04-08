class Question < ApplicationRecord
  belongs_to :step
  has_one :level, through: Step
  has_many :answers
  has_many :results

  delegate :level, to: :step
end
