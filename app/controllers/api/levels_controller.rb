class Api::LevelsController < Api::ApiController
  def index
    @levels = Level.all
  end

  def show
    @level = Level.find_by(identifier: params[:id])
  end
end
