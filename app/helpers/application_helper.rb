module ApplicationHelper
	 def logged_in?
  	!current_author.nil?
  end
end
