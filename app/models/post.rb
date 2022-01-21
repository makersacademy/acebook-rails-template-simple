class Post < ApplicationRecord
    has_many :comments
    has_many :likes, dependent: :destroy
    validates :message, presence: true, length: {maximum: 200}
end
