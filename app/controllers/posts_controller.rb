class PostsController < ApplicationController
  
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource only: [:update, :destroy] 
  
  def index
    @posts = Post.all
  end
  
  def show
    @comment = Comment.new
    @comments = @post.comments
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end
  
  def destroy
    @post.destroy
    redirect_to categories_path
  end
  
  private
  
  def set_post
    @post = Post.find(params[:id])
  end
  
  def post_params
    params.require(:post).permit(:image, :title, :description, :category_id, :user_id)
  end
  
end
