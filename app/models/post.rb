class Post < ActiveRecord::Base
  attr_accessible :idea, :image, :title, :remove_image
  validates :idea, :title, presence:true
  has_many :comments
  has_reputation :votes, source: :user, aggregated_by: :sum

  mount_uploader :image,ImageUploader
  scope :desc, order("created_at DESC")
end
