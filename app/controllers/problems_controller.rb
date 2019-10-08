class ProblemsController < ApplicationController
  before_action :set_problem, only: %I[show edit update destroy]
  before_action :authenticate_user!, only: %I[new edit create destroy]

  def index
    @problems = Problem.page(params[:page] || 1)
  end

  def show; end

  def new
    @problem = Problem.new
  end

  def edit; end

  def create
    @problem = Problem.new(problem_params)
    @problem.user = current_user

    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: "Problem was successfully created." }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @problem.update(problem_params)
        format.html { redirect_to @problem, notice: "Problem was successfully updated." }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url, notice: "Problem was successfully destroyed." }
    end
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
  end

  def problem_params
    params.require(:problem).permit(:title, :description, :user_id)
  end
end
