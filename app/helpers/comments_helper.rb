module CommentsHelper
	def check_status_comment(post)
		@published_comment = Comment.published
		@published_comment.post
  end 
end
