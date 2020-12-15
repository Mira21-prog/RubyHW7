class PostsController < ApplicationController
  before_action :find_authors, only: %i[edit new create update]
  before_action :find_id_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def edit; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def update
    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path
  end

  private

  def find_authors
    @author = Author.all
  end

  def find_id_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image, :author_id)
  end
end
