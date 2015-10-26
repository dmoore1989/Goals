class GoalCommentsController < ApplicationController
  def create
    @comment = GoalComment.new(comment_params)
    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to goal_url(@comment.goal_id)
  end

  def destroy
    @comment = GoalComment.find(params[:id]).destroy
    redirect_to goal_url(@comment.goal_id)
  end

  def comment_params
    params.require(:comment).permit(:comment, :goal_id, :commenter_id)
  end

end
