class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    

    protected
  
    # Configure additional permitted parameters for sign up
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :user_name])
    #   devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_name])
    end

  
  
end
