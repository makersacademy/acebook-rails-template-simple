class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :content,
  presence: { message: "cannot be empty"}
end
