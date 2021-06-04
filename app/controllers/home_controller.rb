class HomeController < ApplicationController

  def index
      @user = User.find_by(id: session[:user_id])
      @posts = Post.order(created_at: :desc)
      @comments = Comment.order(created_at: :desc)
  end

end
