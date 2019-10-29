class ProblemsController < ApplicationController
  before_action :set_problem, only: %I[show edit update destroy]
  before_action :authenticate_user!, only: %I[new edit create destroy]
  before_action :authorize!, only: %I[edit update destroy]

  def index
    @problems = Problem.order("created_at").page(params[:page] || 1)
  end

  def show
    @comments = Comment.where("problem_id = ?", @problem.id).order("created_at")
  end

  def new
    @problem = Problem.new
  end

  def edit; end

  def create
    @problem = Problem.new problem_params.merge(user_id: current_user.id)

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
  end

  def problem_params
    params.require(:problem).permit(:title, :description, :user_id)
  end

  def authorize!
    # TODO: remove this temporarily solution
    redirect_to problems_url, notice: "You are not allowed to change this problem." unless current_user == @problem.user
  end
end
