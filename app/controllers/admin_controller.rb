require 'zip'

class AdminController < ApplicationController
  http_basic_authenticate_with name: 'admin', password: ENV['ADMIN_PASSWORD'] || 'local'

  def index
    @users = User.all
    @levels = Level.all
  end

  def create
    Importer.new(params[:config].tempfile).load
  rescue StandardError => e
    @error = e
  ensure
    render :index
  end
end
