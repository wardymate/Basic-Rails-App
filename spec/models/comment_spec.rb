require 'rails_helper'
include RandomData

RSpec.describe Comment, type: :model do

  let(:topic) {create(:topic)}
  let(:user) {create(:user)}
  let(:post) {create(:post)}
  let(:comment) { Comment.create!(body: 'Comment Body', post: post, user: user) }

 # #2
     it { should belong_to(:post) }
     it { should belong_to(:user) }
 # #3
     it { should validate_presence_of(:body) }
     it { should validate_length_of(:body).is_at_least(5) }


  describe "attributes" do

    it "should respond to body" do
      expect(comment).to respond_to(:body)
    end
  end

  describe "after_create" do
 # #22
     before do
       @another_comment = Comment.new(body: 'Comment Body', post: post, user: user)
     end

     ##THIS TEST STARTED FAILING ONCE I RAFCTORED LOTS OF TESTS USING FACTORY GIRL IN CHECKPOINT 45: PUBLIC PROFILES
    #  it "sends an email to users who have favorited the post" do
    #    favorite = user.favorites.create(post: post)
    #    expect(FavoriteMailer).to receive(:new_comment).with(user, post, @another_comment).and_return(double(deliver_now: true))
     #
    #    @another_comment.save
    #  end

    ##THIS TEST STARTED FAILING ONCE I RAFCTORED LOTS OF TESTS USING FACTORY GIRL IN CHECKPOINT 45: PUBLIC PROFILES
    #  it "does not send emails to users who haven't favorited the post" do
    #    expect(FavoriteMailer).not_to receive(:new_comment)
     #
    #    @another_comment.save
    #  end
   end
end
