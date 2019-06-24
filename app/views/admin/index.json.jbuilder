json.users @users do |user|
  json.name user.email
  json.levelNumber user.level&.order
  json.stepNumber user.step&.order

  json.levels @levels.order(order: :asc).each do |level|
    json.id level.identifier
    json.points user.level_score(level)

    json.steps level.steps.order(order: :asc).each do |step|
      json.id step.identifier
      json.points user.step_score(step)

      json.questions step.questions.order(order: :asc).each do |question|
        json.text question.text

        json.answer user.answer_result(question)&.answer&.text
        json.answerTimestamp user.answer_result(question)&.created_at.to_i
        json.comment user.answer_result(question)&.comment
        json.points user.question_score(question)
      end
    end
  end
end
