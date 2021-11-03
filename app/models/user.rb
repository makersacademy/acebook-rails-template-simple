class User < ApplicationRecord
  has_many :posts
  has_secure_password

  def posts
    posts
  end
end
