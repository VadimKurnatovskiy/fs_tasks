class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :permit_devise_params, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def permit_devise_params
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end

    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :password, :password_confirmation, :current_password)
    end
  end

  def after_sign_in_path_for(_)
    events_path
  end

  private

  def user_not_authorized
    flash[:alert] = 'You dont have permission'
    redirect_to root_url
  end
end
