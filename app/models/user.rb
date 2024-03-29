class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation, :remember_token
  has_secure_password

before_save { |user| user.email = email.downcase }
before_save :create_remember_token

private
def create_remember_token
  self.remember_token = SecureRandom.urlsafe_base64
end

end