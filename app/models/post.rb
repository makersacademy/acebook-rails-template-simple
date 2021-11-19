class Post < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  validates_presence_of :message #if :image_blank?
  #validates_presence_of :image_data #if :message_blank?
  #validates_presence_of :user_id 
  #validates_presence_of :message, :image_data if :both_present? 


=begin
  def invalid_post?
    message_blank? && image_blank?
  end

  def message_blank?
    message.blank?
  end

  def image_blank?
    image_data.blank?
  end
=end 

  #validate message unless image and message are both blank

  belongs_to :user
  has_many :likes
  has_many :comments
  #Should validate presence of text or image
end
