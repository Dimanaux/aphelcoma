module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      auth_data = request.env["omniauth.auth"]
      @user = User.from_omniauth(auth_data)
      if @user.persisted?
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
        sign_in_and_redirect @user, event: :authentication
      else
        session["devise.google_data"] = auth_data.except(:extra)
        redirect_to new_user_registration_url, flash: @user.errors
      end
    end

    def failure
      redirect_to root_path
    end
  end
end
