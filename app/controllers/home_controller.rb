class HomeController < ApplicationController

  def index
      @user = User.find_by(id: session[:user_id])
      @posts = Post.all.order(created_at: :desc)
  end

end
