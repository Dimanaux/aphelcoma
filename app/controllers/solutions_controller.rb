class SolutionsController < ApplicationController
  expose :problem, id: :problem_id
  expose :solution
  expose :solutions, from: :problem
  before_action :authorize_solution, only: %I[show edit update destroy]
  before_action :authenticate_user!

  def index
    authorize solutions
  end

  def show; end

  def new; end

  def create
    solution.user = current_user
    solution.problem = problem
    solution.save
    respond_with solution
  end

  def destroy
    solution.destroy
    respond_with solution, location: -> { problem_path(solution.problem_id) }
  end

  private

  def authorize_solution
    authorize solution
  end

  def solution_params
    params.require(:solution).permit(:code)
  end
end
