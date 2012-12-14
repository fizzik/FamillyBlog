class Post < ActiveRecord::Base
  attr_accessible :idea, :image, :title, :remove_image
  validates :idea, :title, presence:true
  has_many :comments
  has_reputation :votes, source: :user, aggregated_by: :sum

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  mount_uploader :image,ImageUploader
  scope :desc, order("created_at DESC")
end
