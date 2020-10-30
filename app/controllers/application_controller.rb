class ApplicationController < ActionController::Base
  include Response
  include ExceptionHandler
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token
  rescue_from CanCan::AccessDenied do |exception|
    @error_message = exception.message
    render json: {message: @error_message, status: 302}
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user
  respond_to :json

  
  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :device_token, :password, :user_type])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :middle_name, :last_name, :gender, :email, :password, :phone_number, :user_type])
    end
    def authenticate_user!(options = {})
      head :unauthorized unless signed_in?
    end
    def current_user
      @current_user ||= super || User.find(@current_user_id)
    end

    def signed_in?
      @current_user_id.present?
    end

    def authenticate_user
      if request.headers['Authorization'].present?
        token = request.headers['Authorization']
        begin
          jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

          @current_user_id = jwt_payload['id']
        rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
          head :unauthorized
        end
      end
    end
end
