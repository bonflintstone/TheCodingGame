class Result < ApplicationRecord
  belongs_to :user
  has_many :answer_results, dependent: :destroy
  has_many :answers, through: :answer_results

  def questions
    answers.map(&:question)
  end

  def step
    questions.map(&:step).first
  end
end
