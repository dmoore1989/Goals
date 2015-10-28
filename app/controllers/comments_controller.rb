class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    unless @comment.save
      flash[:errors] = @comment.errors.full_messages
    end
    redirect_to "/#{@comment.commentable_type.downcase.pluralize}/#{@comment.commentable_id}"
  end

  def destroy
    @comment = Comment.find(params[:id]).destroy
    redirect_to "/#{@comment.commentable_type.downcase.pluralize}/#{@comment.commentable_id}"
  end

  def comment_params
    params.require(:comment).permit(:comment, :commentable_id, :commentable_type, :commenter_id)
  end
end
