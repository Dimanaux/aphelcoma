class ProblemsController < ApplicationController
  before_action :set_problem, only: %I[show edit update destroy]
  before_action :authenticate_user!, only: %I[new edit create destroy]

  def index
    @problems = Problem.order("created_at").page(params[:page] || 1)
  end

  def show
    @comments = @problem.comments.order(:created_at)
  end

  def new
    @problem = Problem.new
    authorize @problem
  end

  def edit; end

  def create
    @problem = Problem.new problem_params.merge(user_id: current_user.id)
    authorize @problem

    if @problem.save
      redirect_to @problem, notice: "Problem was successfully created."
    else
      render :new
    end
  end

  def update
    if @problem.update(problem_params)
      redirect_to @problem, notice: "Problem was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @problem.destroy
    redirect_to problems_url, notice: "Problem was successfully destroyed."
  end

  private

  def set_problem
    @problem = Problem.find(params[:id])
    authorize @problem
  end

  def problem_params
    params.require(:problem).permit(:title, :description, :user_id)
  end
end
