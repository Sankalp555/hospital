class SessionsController < Devise::SessionsController
  prepend_before_action :verify_signed_out_user, only: :destroy
  
  def create
    user = User.find_by(email: sign_in_params[:email])

    if user && user.valid_password?(sign_in_params[:password])
      user.update(device_token: params[:user][:device_token])
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def destroy
    if params[:user][:user_id]
      user = User.find params[:user][:user_id]
      if user.present?
        reset_session
        user.update({device_token: nil})
        render json: { ok: { 'success' => ['User successfully logout!'] } }
      else
        render json: { errors: { 'not fount' => ['User not found!'] } }, status: :unprocessable_entity
      end
    else
      render json: { errors: { 'not fount' => ['User not found!'] } }, status: :unprocessable_entity
    end
  end

  private

  def verify_signed_out_user
  end
end