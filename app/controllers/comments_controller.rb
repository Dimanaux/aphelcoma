class CommentsController < ApplicationController
  before_action :set_problem
  before_action :set_comment, only: %I[edit update destroy]

  def edit; end

  def create
    context = Comment::Create.call comment_params.merge(user: current_user, problem: @problem)
    @comment = context.comment
    respond_with @comment, location: -> { problem_path(@problem) }
  end

  def update
    @comment.update(comment_params)
    respond_with @comment, location: -> { problem_path(@problem) }
  end

  def destroy
    @comment.destroy
    respond_with @comment, location: -> { problem_path(@problem) }
  end

  private

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:problem_id, :user_id, :text)
  end
end
