class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :results, dependent: :destroy
  belongs_to :level, required: false
  belongs_to :step, required: false

  def answered?(question)
    results.flat_map(&:questions).any? { |q| q == question }
  end

  def done?(level)
    level.questions.to_a.all?(&method(:done?))
 j end

  def update_progress(last_step_finished)
    new_step = last_step_finished.next
    new_level = new_step ? new_step.level : last_step_finished.level.next

    update(step: new_step, level: new_level, finished: new_level.nil?)
  end
end
