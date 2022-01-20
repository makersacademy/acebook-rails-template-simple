class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    validates :message, presence: true, length: {maximum: 200}
end
