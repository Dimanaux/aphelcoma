class SolutionsController < ApplicationController
  before_action :set_problem, only: %I[index new create destroy]
  before_action :set_solution, only: %I[show edit update destroy]
  before_action :authenticate_user!

  def index
    @solutions = Solution.where("problem_id = ?", @problem.id)
    authorize @solutions
  end

  def show; end

  def new
    @solution = Solution.new
    authorize @solution
  end

  def edit; end

  def create
    @solution = Solution.new solution_params.merge(user_id: current_user.id, problem_id: @problem.id)

    if @solution.save
      redirect_to problem_solutions_url(@problem.id), notice: "Solution was successfully created."
    else
      render :new
    end
  end

  def update
    if @solution.update(solution_params)
      redirect_to problem_solutions_url(@problem.id), notice: "Solution was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @solution.destroy
    redirect_to problem_solutions_url(@problem.id), notice: "Solution was successfully destroyed."
  end

  private

  def set_solution
    @solution = Solution.find(params[:id])
    authorize @solution
  end

  def solution_params
    params.require(:solution).permit(:code)
  end

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end
end
