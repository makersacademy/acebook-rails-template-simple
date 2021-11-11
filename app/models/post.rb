class Post < ApplicationRecord

  validates :message, presence: true, unless: :message_blank?
  validates :image_data, presence: true, 

  def invalid_post?
    message_blank? && image_blank?
  end

  def message_blank?
    message.blank?
  end

  def image_blank?

  end

  def valid? 
    
  end

  #validate message unless image and message are both blank

  belongs_to :user
  has_many :likes
  has_many :comments
  #Should validate presence of text or image
end
