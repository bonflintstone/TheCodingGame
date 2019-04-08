class Result < ApplicationRecord
  belongs_to :user
  belongs_to :question
  belongs_to :answer

  delegate :level, to: :question
end
