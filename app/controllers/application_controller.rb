class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :devise_permitted_params, if: :devise_controller?

  protected

  def devise_permitted_params
    [ :age, :city_id, :name ].each do |p|
      devise_parameter_sanitizer.for(:sign_up) << p
      devise_parameter_sanitizer.for(:account_update) << p
    end
  end
end
