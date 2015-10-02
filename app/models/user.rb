class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
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

end
