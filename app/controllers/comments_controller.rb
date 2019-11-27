class CommentsController < ApplicationController
  expose :problem, id: :problem_id
  expose :comment
  before_action :authorize_comment, only: %I[update destroy]

  def edit; end

  def create
    context = Comments::Create.call comment_params.merge(user: current_user, problem: problem)
    comment = context.comment
    if context.success?
      respond_with comment, problem_location
    else
      redirect_to problem, alert: "Text can't be blank."
    end
  end

  def update
    comment.update(comment_params)
    respond_with comment, problem_location
  end

  def destroy
    comment.destroy
    respond_with comment, problem_location
  end

  private

  def problem_location
    { location: -> { problem_path(problem) } }
  end

  def authorize_comment
    authorize comment
  end

  def comment_params
    params.require(:comment).permit(:problem_id, :user_id, :text)
  end
end
