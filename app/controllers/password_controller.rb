class PasswordController < ApplicationController

  def forgot
    if params[:user][:email].blank? # check if email is present
      return render json: {error: 'Email not present'}
    end

    user = User.find_by(email: params[:user][:email]) # if present find user by email

    if user.present?
      user.generate_password_token! #generate pass token
      # SEND EMAIL HERE
      UserMailer.forgot_password_token(user.id).deliver_now
      render json: {status: 'A Token has been sent to your email id!'}, status: :ok
    else
      render json: {error: ['Email address not found. Please check and try again.']}, status: :not_found
    end
  end

  def change_password
    
  end

  def reset
    token = params[:user][:reset_password_token].to_s
    
    user = User.find_by(reset_password_token: token)
    if user.present? && user.password_token_valid?
      if user.reset_password!(params[:user][:password])
        render json: {status: 'You have successfully updated your password!'}, status: :ok
      else
        render json: {error: user.errors.full_messages}, status: :unprocessable_entity
      end
    else
      render json: {error:  ['Link not valid or expired. Try generating a new link.']}, status: :not_found
    end
  end
end
