class UserCommentsController < ApplicationController
  def create
    @comment = UserComment.new(comment_params)
    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to user_url(@comment.user_id)
  end

  def destroy
    @comment = UserComment.find(params[:id]).destroy
    redirect_to user_url(@comment.user_id)
  end

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :commenter_id)
  end
end
