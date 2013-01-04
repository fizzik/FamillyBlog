class Letter < ActiveRecord::Base
  attr_accessible :email, :fio, :letter, :phone, :town
  scope :desc, order("created_at DESC")
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence => true,
            :format   => { :with => email_regex }

  validates :fio, :presence => true
  validates :letter, :presence => true



end
