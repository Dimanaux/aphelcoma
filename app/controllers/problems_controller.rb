class ProblemsController < ApplicationController
  expose :problem
  before_action :authorize_problem, only: %I[show new edit update destroy]
  before_action :authenticate_user!, only: %I[new edit create destroy]

  def index
    @problems = Problem.order("created_at").page(params[:page] || 1)
  end

  def show
    Views::Create.call(user: current_user, problem: problem)
  end

  def new; end

  def edit; end

  def create
    problem.user = current_user
    authorize problem
    problem.save
    respond_with problem
  end

  def update
    problem.update(problem_params)
    respond_with problem
  end

  def destroy
    problem.destroy
    respond_with problem
  end

  private

  def authorize_problem
    authorize problem
  end

  def problem_params
    params.require(:problem).permit(:title, :description, :user_id)
  end
end
