class PostsController < ApplicationController
  before_action :find_authors, only: %i[edit new create update]
  before_action :find_id_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    author = Author.find(params[:author_id])
    @post = author.posts.build(post_params)
    if @post.save
      redirect_to posts_path
    else
      find_authors
      render 'new'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      find_authors
      render 'edit'
    end
  end

  def destroy
    @post.destroy!
    redirect_to posts_path
  end

  private

  def find_authors
    @authors = Author.all
  end

  def find_id_post
    @post = Post.find(params[:id])
  end

  def post_params
    p_params = params.require(:post).permit(:title, :content, :image)
    p_params[:author_id] = params[:author_id] if action_name == 'update'
    p_params
  end
end
