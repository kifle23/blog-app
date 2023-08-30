class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  helper_method :current_user

  private

  def current_user
    super
  end
end