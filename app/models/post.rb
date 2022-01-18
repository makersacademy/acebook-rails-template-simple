class Post < ApplicationRecord
    validates :message, presence: true, length: {in: 10..200}
end
