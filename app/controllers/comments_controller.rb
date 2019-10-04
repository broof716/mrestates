class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @estate = Estate.find(params[:estate_id])
    @estate.comments.create(comment_params.merge(user: current_user))
    redirect_to estate_path(@estate)
  end

  private

  def comment_params
    params.require(:comment).permit(:message, :rating)
  end
end
