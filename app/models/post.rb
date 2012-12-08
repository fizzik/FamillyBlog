class Post < ActiveRecord::Base
  attr_accessible :idea, :image_path, :title
  validates :idea, :title, presence:true
end
