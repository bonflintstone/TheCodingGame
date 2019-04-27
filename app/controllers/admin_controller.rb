class AdminController < ApplicationController
  def index
    @users = User.all
    @levels = Level.all
  end
end
