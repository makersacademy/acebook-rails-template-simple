class Post < ApplicationRecord
  has_many :comments
  belongs_to :user

  validates :message, presence: true
end
