class Api::ResultsController < Api::ApiController
  def create
    Result.create(
      user: current_user,
      answer_ids: params[:answer_ids],
      step_id: params[:step_id]
    )
  end
end
