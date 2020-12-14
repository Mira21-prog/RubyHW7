class PostsController < ApplicationController
   before_action :find_authors, only: [:edit, :new, :create, :update]

    def index
        @posts = Post.all
    end

    def show 
      @post = Post.find(params[:id])
    end 

    def edit 
      @post = Post.find(params[:id])
    end
    
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
      @post = Post.find(params[:id])
      if @post.update_attributes(post_params)
        redirect_to posts_path
      else
        render 'edit'
      end
    end 

    def destroy 
      @post = Post.find(params[:id])
      @post.destroy!
      redirect_to posts_path
    end

    private 

    def find_authors
      @author  = Author.all
    end

    def post_params 
        params.require(:post).permit(:title, :content, :image, :author_id)
    end     
end
