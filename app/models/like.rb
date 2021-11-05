class Like < ApplicationRecord
  belongs_to :posts, foreign_key: true
  belongs_to :user, foreign_key: true
end
