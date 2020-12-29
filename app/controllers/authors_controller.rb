class AuthorsController < ApplicationController

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
	
	def destroy
    log_out
    redirect_to root_url
  end

	private 

	def author_params
		params.require(:author).permit(:first_name, :last_name, :email, :gender, :birthday, :password, :password_confirmation)
	end

end
