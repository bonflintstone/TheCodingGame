class Answer < ApplicationRecord
  belongs_to :question
  has_many :answer_results, dependent: :destroy
  has_many :results, through: :answer_results
end
