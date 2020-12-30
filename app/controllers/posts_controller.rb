class PostsController < ApplicationController
  impressionist actions: [:show]
  before_action :find_authors, only: %i[show edit new create update]
  before_action :find_id_post, only: %i[show edit update destroy]
  

  def index
    @posts = Post.all
    @parameter = params[:search]&.downcase  
    if @parameter.present?
      @posts = @posts.where("title LIKE :search OR content LIKE :search", search: "%#{@parameter}%")
    end
  end

  def show
    @comment = @post.comments.build
    @comments = if params[:status].nil?
                  @post.comments.published
                elsif params[:status] == 'published'
                  @post.comments.published
                else
                  @post.comments.unpublished
                end
  end

  def edit; end

  def new
    @post = Post.new
  end

  def create
    
    @post = current_author.posts.build(post_params)
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
    current_author
  end

  def find_id_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :image)
  end
end
