class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :update_allowed_parameters, if: :devise_controller?
  helper_method :current_user

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :password_confirmation)
    end
  end

  private

  def current_user
    super
  end
end