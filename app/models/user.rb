class User < ApplicationRecord
  
  
  validates :email, uniqueness: true
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
