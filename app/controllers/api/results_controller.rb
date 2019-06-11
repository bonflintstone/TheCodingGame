class Api::ResultsController < Api::ApiController
  def create
    Result.create(
      user: current_user,
      answer_results: answer_results,
      step_id: params[:step_id]
    )

    current_user.update_progress(Step.find(params[:step_id]))
  end

  private

  def answer_results
    params[:answer_ids].zip(params[:comments]).map do |answer_id, comment|
      AnswerResult.new(answer_id: answer_id, comment: comment)
    end
  end
end
