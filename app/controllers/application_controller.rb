class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :current_user

  def current_user
    @current_user ||= User.first
  end

  private

  def set_current_user
    @current_user = current_user
  end
end
