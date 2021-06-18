class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/kensis/#{comment.kensi_id}" 
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, kensi_id: params[:kensi_id])
  end
end
