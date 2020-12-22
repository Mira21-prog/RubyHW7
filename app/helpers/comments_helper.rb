module CommentsHelper
  def check_status_comment(_post)
    @published_comment = Comment.published
    @published_comment.post
  end
end
