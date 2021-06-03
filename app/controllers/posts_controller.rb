class PostsController < ApplicationController

  before_action :ensure_user_authenticated, only: [:new, :create, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to root_url
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_url
  end

  private
  def post_params
    params.require(:post).permit(:body, :user_id)
  end

  def ensure_user_authenticated
    if current_user == nil
      flash.alert = "you must be logged in"
      redirect_to root_url
    end
  end
end
