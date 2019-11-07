class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery

  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not allowed to perform this action."
    redirect_to(request.referrer || root_path)
  end
end
