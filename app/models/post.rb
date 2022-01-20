class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :message, presence: true
end
