class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def student_params
    params.require(:user).permit(:id)
  end

end
