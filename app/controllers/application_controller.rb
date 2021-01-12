class ApplicationController < ActionController::Base
	include SessionsHelper
  protect_from_forgery with: :null_session
  before_action -> { cookies[:views] = cookies[:views].present? ? cookies[:views].to_i + 1 : 1 }
end
