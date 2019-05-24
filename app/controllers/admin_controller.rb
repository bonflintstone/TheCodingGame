require 'zip'

class AdminController < ApplicationController
  def index
    @users = User.all
    @levels = Level.all
  end

  def create
    Importer.new(params[:config].tempfile).load

    render :index
  end
end
