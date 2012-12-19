class Letter < ActiveRecord::Base
  attr_accessible :email, :fio, :letter, :phone, :town

  validates :email,  :presence => true
  validates :fio, :presence => true
  validates :letter, :presence => true
  validates :phone, :presence => true
  validates :town, :presence => true
end
