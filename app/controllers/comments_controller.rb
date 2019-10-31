class CommentsController < ApplicationController
  before_action :set_problem
  before_action :set_comment, only: %I[update destroy]

  def create
    @comment = Comment.new comment_params.merge(user_id: current_user.id, problem_id: @problem.id)

    if @comment.save
      redirect_to @problem, notice: "Comment was successfully created."
    else
      redirect_to @problem
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @problem, notice: "Comment was successfully updated."
    else
      redirect_to @problem
    end
  end

  def destroy
    @comment.destroy
    redirect_to @problem, notice: "Comment was successfully destroyed."
  end

  private

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:problem_id, :user_id, :text)
  end
end
