class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :post_id, uniqueness: {
    scope: [ :user_id ],
    message: "A user can only like a post once"
  }

end
