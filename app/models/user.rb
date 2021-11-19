class User < ApplicationRecord
mount_uploader :photo, PhotoUploader
has_secure_password
  has_many :posts
  has_many :comments
  has_many :likes
  has_many :friend_sent, class_name: 'Friendship',
                         foreign_key: 'sent_by_id',
                         inverse_of: 'sent_by',
                         dependent: :destroy
  has_many :friend_request, class_name: 'Friendship',
                         foreign_key: 'sent_to_id',
                         inverse_of: 'sent_to',
                         dependent: :destroy
  has_many :friends, -> { merge(Friendship.friends) },
           through: :friend_sent, source: :sent_to
  has_many :pending_requests, -> { merge(Friendship.not_friends) },
           through: :friend_sent, source: :sent_to
  has_many :received_requests, -> { merge(Friendship.not_friends) },
           through: :friend_request, source: :sent_by
validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "Invalid email" }
validates_presence_of :first_name, :last_name, :date_of_birth
end
