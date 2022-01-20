class User < ApplicationRecord

  validates :name, presence: true, format: { with: /\A[a-zA-Z]+\z/ } 
  validates :email, presence: true, length: { in: 5..30 }, uniqueness: true
  validates :password, presence: true, length: { in: 5..15 }
end
