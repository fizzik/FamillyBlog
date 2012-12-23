class Post < ActiveRecord::Base
  attr_accessible :idea, :image, :title, :remove_image, :crop_x, :crop_y, :crop_w, :crop_h
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  validates :idea, :title, presence:true
  has_many :comments
  has_reputation :votes, source: :user, aggregated_by: :sum
  scope :desc, order("created_at DESC")

  def self.search(search)
    if search
      find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  mount_uploader :image, ImageUploader

  after_update :crop_image

  def to_jq_upload
    {
        "name" => read_attribute(:image),
        "size" => image.size,
        "url" => image.url,
        "thumbnail_url" => image.thumb.url,
        "delete_url" => id,
        "picture_id" => id,
        "delete_type" => "DELETE"
    }
  end

  def crop_image
    image.recreate_versions! if crop_x.present?
    current_version = self.image.current_path
    large_version = "#{Rails.root}/public" + self.image.versions[:large].to_s

    FileUtils.rm(current_version)
    FileUtils.cp(large_version, current_version)
  end
  def self.by_votes
    select('posts.*, coalesce(value, 0) as votes').
        joins('left join post_votes on post_id=posts.id').
        order('votes desc')
  end

  def votes
    read_attribute(:votes) || post_votes.sum(:value)
  end
end
