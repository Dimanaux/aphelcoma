class UsersController < ApplicationController
  def index
    @users = User.page(params[:page] || 1)
  end

  def show
    @user = User.find_by(username: params[:username])
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end
end
