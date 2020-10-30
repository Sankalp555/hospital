class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters
  
  def create
    if params[:user][:user_type] == "Doctor"
      doctor = Doctor.create(user_params)
      render json: { doctor: doctor }, status: 200
    elsif params[:user][:user_type] == "Patient"
      patient = Patient.create(user_params)
      render json: { patient: patient }, status: 200
    else
      render json: { errors: "Error" }, status: :unprocessable_entity
    end  
  end
  
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :middle_name, :last_name, :gender, :email, :password, :device_token, :user_type, :phone_number])
  end
  def user_params
    params.require(:user).permit(:first_name, :middle_name, :last_name, :gender, :email, :password, :device_token, :phone_number, :user_type)
  end
end