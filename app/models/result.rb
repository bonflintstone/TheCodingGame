class Result < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :answers

  def questions
    answers.map(&:question)
  end

  def step
    questions.map(&:step).first
  end
end
