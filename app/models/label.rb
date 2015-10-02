class Label < ActiveRecord::Base
  has_many :labelings
 # #6
   belongs_to :labelable, polymorphic: true
 # #7
   has_many :topics, through: :labelings, source: :labelable, source_type: :Topic
 # #8
   has_many :posts, through: :labelings, source: :labelable, source_type: :Post

   def self.update_labels(label_string)
  new_labels = []
# #25
  unless label_string.nil? || label_string.empty?
# #26
    label_string.split(",").each do |label|
    label_name = label.strip
    new_label = Label.find_or_create_by(name: label_name)
    new_labels << new_label
    end
  end
  new_labels
end
end
