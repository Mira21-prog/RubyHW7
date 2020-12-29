class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action -> { cookies[:views] = cookies[:views].present? ? cookies[:views].to_i + 1 : 1 }

  include SessionsHelper
end
