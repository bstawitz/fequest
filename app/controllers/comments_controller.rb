class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Feature.find_by_id(params[:feature_id]).comments.new(comment_params)
    if @comment.save
      redirect_to @comment.feature, notice: "Comment was created"
    else
      redirect_to @comment.feature, alert: "Comment invalid"
    end
  end

  def destroy
    @comment = Comment.find_by_id(params[:id])
    return unless @comment.present?

    @feature = @comment.feature

    @comment.delete

    redirect_to @feature, notice: "Comment deleted"
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :upvotes, :downvotes, :feature_id)
  end
end
