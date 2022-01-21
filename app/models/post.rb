class Post < ApplicationRecord
    has_many :comments
    validates :message, length: {maximum: 200}
    has_one_attached :image
end
