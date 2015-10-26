class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :favorites, dependent: :destroy
  before_save :downcase_email
  before_save :capitalize_name
  before_save { self.role ||= :member }


  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # NAME_REGEX = /\A[A-Z][a-z]*\b/

  validates :name,
            length: { minimum: 1, maximum: 100 },
            presence: true

  # #5
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  # #6
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 100 },
            format: { with: EMAIL_REGEX }

  has_secure_password

  enum role: [:member, :admin]

def downcase_email
  self.email = email.downcase
end

def capitalize_name
  return if name.split.length <=  1
  self.name = (name.split.each do |x| x.capitalize! end).join(' ')
end

def favorite_for(post)
  favorites.where(post_id: post.id).first
end

def self.avatar_url(user, size)
  gravatar_id = Digest::MD5::hexdigest(user.email).downcase
  "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"   
end

end
