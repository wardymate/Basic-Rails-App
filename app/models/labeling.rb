class Labeling < ActiveRecord::Base
# #2
  belongs_to :labelable, polymorphic: true
  belongs_to :label
end
