# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # protect_from_forgery with: :null_session
  before_action :authenticate_account!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def after_sign_in_path_for(_resource)
    account_path(current_account)
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
