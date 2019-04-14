class Answer < ApplicationRecord
  belongs_to :question
  has_many :result
  has_and_belongs_to_many :results
end
