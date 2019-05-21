class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :results, dependent: :destroy
  belongs_to :level, optional: true
  belongs_to :step, optional: true

  def answered?(question)
    results.flat_map(&:questions).any? { |q| q == question }
  end

  def done?(level)
    level.questions.to_a.all?(&method(:done?))
  end

  def level_score(level)
    level.steps.sum(&method(:step_score))
  end

  def step_score(step)
    step.questions.sum(&method(:question_score))
  end

  def question_score(question)
    question_answer(question)&.points.to_i
  end

  def question_answer(question)
    (Answer.where(question: question).to_a & results.flat_map(&:answers)).first
  end

  def update_progress(last_step_finished)
    new_step = last_step_finished.next
    new_level = new_step ? new_step.level : last_step_finished.level.next

    update(step: new_step, level: new_level, finished: new_level.nil?)
  end
end
