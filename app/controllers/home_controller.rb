class HomeController < ApplicationController

  def index
      @posts = Post.order(created_at: :desc).includes(comments: [:user])
  end

end
