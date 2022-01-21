class Post < ApplicationRecord
    has_many :comments
    has_one_attached :image
    validate :image_or_message

    def image_or_message
        errors.add("Post needs a message or an image") unless image.attached? || message.present? && message.length < 200
    end
end
