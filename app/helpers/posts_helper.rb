module PostsHelper
  def get_author(post)
    get_author_id = post.author_id
    author = Author.find(get_author_id)
    author.first_name.to_s + " #{author.last_name}"
  end
end
