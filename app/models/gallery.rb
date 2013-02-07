class Gallery < ActiveRecord::Base
  attr_accessible :cover, :description, :name
  has_many :pictures, :dependent => :destroy

  scope :desc, order("created_at DESC")
end
