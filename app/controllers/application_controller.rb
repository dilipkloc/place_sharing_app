# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: %i[first_name last_name username name email password password_confirmation])
    devise_parameter_sanitizer.permit(:sign_in,
                                      keys: %i[login password password_confirmation])
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[first_name last_name username name email password_confirmation current_password])
  end
end
