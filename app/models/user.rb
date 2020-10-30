class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable

  devise :database_authenticatable, :registerable, :confirmable,
  :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :phone_number, :user_type, :email, presence: true

  def generate_jwt
    JWT.encode({ id: id,
              exp: 60.days.from_now.to_i },
             Rails.application.secrets.secret_key_base)
  end

  def generate_password_token!
    self.reset_password_token = generate_token
    self.reset_password_sent_at = Time.now.utc
    save!
  end

  def admin?
    type == 'Admin'
  end
  
  def doctor?
    type == 'Doctor'
  end

  def patient?
    type == 'Patient'
  end

  def full_name
    result = first_name || ""
    result += " #{last_name}" if last_name.present?
  end

  def password_token_valid?
    (self.reset_password_sent_at + 4.hours) > Time.now.utc
  end

  def reset_password!(password)
    self.reset_password_token = nil
    self.password = password
    save!
  end
  
  def full_name
    result = first_name || ""
    result += " #{last_name}" if last_name.present?
  end

  private

  def generate_token
    SecureRandom.hex(8)
  end
end