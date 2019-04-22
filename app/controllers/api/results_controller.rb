class Api::ResultsController < Api::ApiController
  def create
    Result.create(
      user: current_user,
      answer_ids: params[:answer_ids],
      step_id: params[:step_id]
    )

    current_user.update_progress(Step.find(params[:step_id]))
  end
end
