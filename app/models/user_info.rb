class UserInfo < ActiveRecord::Base
  attr_accessible :about, :date_of_birth, :phone, :skype, :town
  has_many :users
end
