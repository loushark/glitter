class CommentsController < ApplicationController

  before_action :find_post

  def new
    @comment = Comment.new
  end

  def create
    @post.comments.create(comment_params.merge(user_id: current_user.id))
       redirect_to root_url
  end

  private

    def find_post
      @post = Post.find(params[:post_id])
    end

    def comment_params
      params.require(:comment).permit(:message)
    end
end
