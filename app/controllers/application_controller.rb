class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :config_permited_parameters, if: :devise_controller?

  def user_is_admin?
    signed_in? && current_user.is_admin?
  end

  protected

    def config_permited_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo])
    end
end
