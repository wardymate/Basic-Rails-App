class Rating < ActiveRecord::Base
  belongs_to :rate
  belongs_to :rateable
  # belongs_to :post
  # belongs_to :topic
end
