class CommentsController < ApplicationController
  before_action :authenticate_user!

  def ajax_create
    @comment = Feature.find(params[:feature_id]).comments.new(comment_params)
    if @comment.save
      redirect_to @comment.feature, notice: "Comment was created"
    else
      redirect_to @comment.feature, alert: "Comment invalid"
    end
  end

  def ajax_delete
    @comment = Comment.find(params[:id])
    @feature = @comment.feature

    @comment.delete

    redirect_to @feature, notice: "Comment deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :upvotes, :downvotes, :feature_id)
  end
end
