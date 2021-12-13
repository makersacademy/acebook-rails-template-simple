class User < ApplicationRecord

   #email:string
  #password_digest:string
  #
  # password:string virtual
  # password_confirmation:string virtual
  has_secure_password
  has_one_attached :image


  validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}
  validates :password, presence: true
  
end 