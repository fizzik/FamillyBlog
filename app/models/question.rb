class Question < ActiveRecord::Base
  attr_accessible :answer, :ask
  scope :desc, order("created_at DESC")

  validates :ask, :presence => true
end
