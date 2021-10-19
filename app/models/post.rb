class Post < ApplicationRecord
  scope :newest_first, -> { order(created_at: :desc) }
  belongs_to :user

end
