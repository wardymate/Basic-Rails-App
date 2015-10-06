class Rate < ActiveRecord::Base
  enum severity: [:PG, :PG13, :R]
  belongs_to :rateable, polymorphic: true
  has_many :ratings
  has_many :topics, through: :ratings, source: :rateable, source_type: :Topic
  has_many :posts, through: :ratings, source: :rateable, source_type: :Post


end
