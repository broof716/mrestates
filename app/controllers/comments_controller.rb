class CommentsController < ApplicationController
 before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.create(comment_params)
    if @comment.valid?
      redirect_to comment_comments_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
