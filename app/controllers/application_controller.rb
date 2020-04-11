class ApplicationController < ActionController::Base
    before_action :configure_devise_parameters, if: :devise_controller?

    private
  
    def configure_devise_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
      devise_parameter_sanitizer.permit(:account_update, keys: [:fullname])
    end
end
