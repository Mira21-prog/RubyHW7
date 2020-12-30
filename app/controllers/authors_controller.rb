class AuthorsController < ApplicationController
	before_action :signed_in_author, only: [:edit, :update]
  before_action :correct_author,   only: [:edit, :update]

	def new
		@author = Author.new
	end 

	def show
		@author = Author.find(params[:id])
	end 

	def create 
		@author = Author.new(author_params)
		if @author.save
			log_in @author
			redirect_to posts_path
		else 
			render 'new'
		end
	end

	def edit
	  @author = Author.find(params[:id]) 
	end 

	def update 
		@author = Author.find(params[:id])

		if params[:author][:avatar].present?
			update_avatar
			redirect_to @author and return
		end
		
    if @author.update_attributes(author_params)
    	log_in @author
      redirect_to @author
    else
      render 'edit'
    end
	end



	private

	def update_avatar
		@author.avatar.attach(params[:author][:avatar])
	end

	  def signed_in_author
      redirect_to signin_url unless logged_in?
    end

    def correct_author
      @author = Author.find(params[:id])
      redirect_to(root_url) unless current_author?(@author)
    end

	def author_params
		params.require(:author).permit(:first_name, :last_name, :email, :gender, :birthday, :password, :password_confirmation, :avatar)
	end
end
