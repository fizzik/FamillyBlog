class Post < ActiveRecord::Base
  attr_accessible :idea, :image, :title, :remove_image
  validates :idea, :title, presence:true
  has_many :comments
  has_reputation :votes, source: :user, aggregated_by: :sum
  scope :desc, order("created_at DESC")
  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    else
    scoped
    end
  end

  mount_uploader :image,ImageUploader
end
