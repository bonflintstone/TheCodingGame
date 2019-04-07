class UserSessionsController < ApplicationController
  def new
    @User = User.new
  end

  def create
    @user = login(params[:email], params[:password])

    if @user
      redirect_back_or_to(:game)
    else
      flash.now[:alert] = 'Login Failed'
      render action: :new
    end
  end

  def destroy
    logout
    redirect_to new_user_session_path
  end
end
