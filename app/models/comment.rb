class Comment < ActiveRecord::Base
  attr_accessible :content, :post_id, :user_id
  belongs_to :post
  belongs_to :user
  validates :content, :presence => true, :length => { :maximum => 1000 }
  validates :user_id, :post_id, :presence => true


  scope :desc, order("created_at DESC")
end