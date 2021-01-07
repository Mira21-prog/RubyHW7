module CommentsHelper
  def check_status_comment(_post)
    @published_comment = Comment.published
    @published_comment.post
  end

  def votes_count(vote_type, comment)
    v_count = comment.author_comment_votes.where(vote_value: vote_type).count
    v_count.positive? ? v_count : ''
  end

  def vote_button_class(base_class, comment)
    return "#{base_class} disabled" unless logged_in?

    current_author.has_vote?(comment) ? "#{base_class} disabled" : base_class
  end

  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      render(comment) + content_tag(:div, nested_comments(sub_comments), class: 'nested_comments')
    end.join.html_safe
  end
end
