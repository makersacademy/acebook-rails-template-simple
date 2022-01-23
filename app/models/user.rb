class User < ApplicationRecord
    has_one_attached :avatar # do |attachable|
        #attachable.variant :thumb, resize: "200x200"
      #end
    has_many :posts
    has_many :comments
    has_secure_password
    validates :email, presence: true
end
