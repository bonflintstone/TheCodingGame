class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :results, dependent: :destroy
  belongs_to :level
  belongs_to :step

  def answered?(question)
    results.flat_map(&:questions).any? { |q| q == question }
  end

  def done?(level)
    level.questions.to_a.all?(&method(:done?))
  end

  def update_progress(last_step_finished)
    if steps.next.present?
      update(step: last_step_finished.next)
    else
      update(step: null, level: last_step_finished.level.next)
    end
  end
end
