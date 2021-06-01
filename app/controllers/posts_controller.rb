class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.create(params.permit(:body, :user_id))
    redirect_to root_url
  end

  def show
  end

  def update
  end

  def destroy
  end
end
