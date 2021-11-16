# app/models/user.rb
    
class User < ActiveRecord::Base

  has_secure_password

  validates :email, presence: :true, uniqueness: { case_sensitive: false }
  # validates :password_digest, presence: :true
  validates :first_name, presence: :true
  validates :last_name, presence: :true
  # validates :name, presence: :true
  validates :password, length: { minimum: 8 }
  # validates :name, uniqueness: { case_sensitive: false }

  def self.authenticate_with_credentials(email, password)
    @user = self.where("lower(email) = ?", email.delete(' ').downcase).first.try(:authenticate, password)
  end
end