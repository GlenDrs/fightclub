class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :config_permited_parameters, if: :devise_controller?

  protected

    def config_permited_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:pseudo])
    end
end
