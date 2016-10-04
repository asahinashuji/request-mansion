class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :tel, presence: true
  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
end