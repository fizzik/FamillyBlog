class Post < ActiveRecord::Base
  attr_accessible :idea, :image, :title, :remove_image
  validates :idea, :title, presence:true
  has_many :comments
  mount_uploader :image,ImageUploader
end
