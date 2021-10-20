class Post < ApplicationRecord

 belongs_to :user
 has_many :comments

 scope :newest_first, -> { order(created_at: :desc) }
 has_one_attached :image

end
