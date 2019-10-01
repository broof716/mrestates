class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.new
  end

  def create
    @comment = Comment.find(params[:id])
    @comment.comments.create(comment_params.merge(user: current_user))
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
