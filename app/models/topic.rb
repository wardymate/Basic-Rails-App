class Topic < ActiveRecord::Base
  has_many :posts, dependent: :destroy

  has_many :labelings, as: :labelable
# #14
  has_many :labels, through: :labelings
  has_many :rates, through: :ratings
  has_many :ratings, as: :rateable

  scope :visible_to, -> (user) {user ? all : where(public: true)}

  validates :name, length: { minimum: 5 }, presence: true
  validates :description, length: { minimum: 15 }, presence: true

  def update_rating(new_rating)
    case new_rating
    when "PG"
      self.rates.first.PG!
    when "PG13"
      self.rates.first.PG13!
    when "R"
      self.rates.first.R!
    else
      return nil
    end
  end
end
