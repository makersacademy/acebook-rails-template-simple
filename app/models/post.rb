class Post < ApplicationRecord
    validates :message, presence: true, length: {maximum: 200}
end
