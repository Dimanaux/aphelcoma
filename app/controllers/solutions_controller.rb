class SolutionsController < ApplicationController
  before_action :set_problem, only: %I[index new create]
  before_action :set_solution, only: %I[show edit update destroy]

  def index
    @solutions = Solution.all
  end

  def show; end

  def new
    @solution = Solution.new
  end

  def edit; end

  def create
    @solution = Solution.new(solution_params)

    if @solution.save
      redirect_to @solution, notice: "Solution was successfully created."
    else
      render :new
    end
  end

  def update
    if @solution.update(solution_params)
      redirect_to @solution, notice: "Solution was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @solution.destroy
    redirect_to solutions_url, notice: "Solution was successfully destroyed."
  end

  private

  def set_solution
    @solution = Solution.find(params[:id])
  end

  def solution_params
    params.require(:solution).permit(:user_id, :problem_id, :code)
  end

  def set_problem
    @problem = Problem.find(params[:problem_id])
  end
end
