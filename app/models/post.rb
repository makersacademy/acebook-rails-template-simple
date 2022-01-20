class Post < ApplicationRecord
    has_many :comments
    validates :message, presence: true, length: {maximum: 200}
end
