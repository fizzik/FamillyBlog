class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name, :email, :password, :password_confirmation, :image, :remove_image
  mount_uploader :image,ImageUploader

  has_many :comments
  has_many :evaluations, class_name: "RSEvaluation", as: :source

  def voted_for?(post)
    evaluations.where(target_type: post.class, target_id: post.id).present?
  end


  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name,  :presence => true,
            :presence => {:message => "Please enter your name"},
            :length   => { :maximum => 15, :message => "Max 15 symbol" }


  validates :email, :presence => true,
            :presence => {:message => "Please enter your email"},
            :format   => { :with => email_regex, :message => "Error email" },
            :uniqueness => { :case_sensitive => false }

  validates :password, :presence => true,
            :presence => {:message => " Please enter password"},
            :confirmation => true,
            :length       => { :within => 6..40, :message => "Is too short (minimum 6 characters" }

  validates :image, :presence => true,
            :presence => {:message => "You must add image"}


  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  private

  def encrypt_password
    self.salt = make_salt if new_record?
    self.encrypted_password = encrypt(password)
  end

  def encrypt(string)
    secure_hash("#{salt}--#{string}")
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end
