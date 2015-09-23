require 'rails_helper'

RSpec.describe Question, type: :model do
# #1
  let(:question) { Question.create!(title: "New Question Title", body: "New Question Body", resolved: "Boolean value") }

  describe "attributes" do
# #2
    it "should respond to title" do
      expect(question).to respond_to(:title)
    end
# #3
    it "should respond to body" do
      expect(question).to respond_to(:body)
    end
    it "should respond to resolved" do
      expect(question).to respond_to(:resolved)
    end
  end
end
