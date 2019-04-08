class Api::ApiController < ApplicationController
  before_action :require_login

  format 'json'
end
