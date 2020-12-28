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
			redirect_to @posts
		else 
			render 'new'
		end
	end

	private 

	def author_params
		params.require(:author).permit(:first_name, :last_name, :email, :gender, :birthday, :password, :password_confirmation)
	end

end
