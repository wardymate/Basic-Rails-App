require 'rails_helper'

 RSpec.describe Labeling, type: :model do
 # #1
   it { should belong_to :labelable }
 end
