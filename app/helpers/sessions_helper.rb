module SessionsHelper

	def log_in(author)
    session[:author_id] = author.id
  end

  def current_author 
  	@current_author ||= Author.find_by(id: session[:author_id])
  end

  def logged_in?
  	!current_author.nil?
  end

  def log_out
    session.delete(:author_id)
    @current_author = nil
  end

  def get_owner_post?(post)
  	post.author_id == current_author.id
  end

  def current_author?(author)
    author == current_author
  end

end
