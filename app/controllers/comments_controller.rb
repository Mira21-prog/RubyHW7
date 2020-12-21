class CommentsController < ApplicationController
	before_action :find_post!, only: %i[edit create destroy update]
	before_action :find_comment!, only: %i[edit destroy update]

	def edit 
	end 

	def create 
		@comment = @post.comments.create(comment_params)
		redirect_to post_path(@post)
	end 

	def destroy 
		@comment.destroy
		redirect_to post_path(@post)
	end 

	def update
		params[:published].nil? ?  @comment.update(comment_params) : @comment.published!
		redirect_to post_path(@post)
	end

	private 

	def find_post! 
		@post = Post.find(params[:post_id])
	end

	def find_comment!
		@comment = @post.comments.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:commenter, :body, :status)
	end
end
