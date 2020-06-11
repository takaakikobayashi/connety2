class ApplicationController < ActionController::Base
	 before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_scholastic_records_path
    when User
      user_scholastic_records_path(resource)
    when Requester
      requester_path(resource)
    when Company
      company_path(resource)
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def correct_user
  redirect_to(root_url) unless current_user
end

def correct_requester
  redirect_to(root_url) unless current_requester
end

def correct_company
  redirect_to(root_url) unless current_company
end

def active_user
  if current_user.is_active == false
    sign_out(current_user)
  redirect_to home_suspension_path
end
end

def active_requester
  if current_requester.is_active == false
    sign_out(current_requester)
  redirect_to home_suspension_path
end
end

def active_company
  if current_company.is_active == false
    sign_out(current_company)
  redirect_to home_suspension_path
end
end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :user_name, :grade, :other_grade, :phone_number, :image_id, :learning_status, :business_name, :name, :is_active, :postal_code, :address])
  end
end
