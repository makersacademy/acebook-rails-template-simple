class Post < ApplicationRecord

  belongs_to :user
  has_many :likes
  has_many :comments
  #Should validate presence of text or image
end
