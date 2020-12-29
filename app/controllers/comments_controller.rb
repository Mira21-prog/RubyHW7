class CommentsController < ApplicationController
  before_action :find_post!, only: %i[edit create destroy update]
  before_action :find_comment!, only: %i[edit destroy update]
  before_action :find_authors, only: %(edit create update)

  def edit; end

  def create
    @comment = @post.comments.build(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render template: 'posts/show'
    end
  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  def update
    if params[:published].nil?
      @comment.update!(comment_params)
    else
      @comment.published!
    end
    redirect_to post_path(@post)
  rescue ActiveRecord::RecordInvalid => e
    render 'edit'
  end

  private

  def find_authors
    @authors = Author.all
  end

  def find_post!
    @post = Post.find(params[:post_id])
  end

  def find_comment!
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params_s = params.require(:comment).permit(:body, :status)
    params_s[:author_id] = current_author.id
    params_s
  end
end
