class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      user_scholastic_records_path(resource)
    when Requester
      root_path
    when Company
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :user_name, :grade, :other_grade, :phone_number, :image_id, :learning_status])
  end
end
