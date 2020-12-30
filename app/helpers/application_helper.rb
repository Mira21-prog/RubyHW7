module ApplicationHelper
	 def logged_in?
  	!current_author.nil?
  end

  def show_modal?
  	(cookies[:views] >= 5) &&
  	 !logged_in?  &&
  	  (controller.class.name != 'SessionController') &&
  	  (controller.class.name != 'AuthorsController')
  end
end
