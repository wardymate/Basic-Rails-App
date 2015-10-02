include RandomData
# Create Users
 5.times do
   user = User.create!(
 # #3
   name:     RandomData.random_name,
   email:    RandomData.random_email,
   password: RandomData.random_sentence
   )
 end
 users = User.all
# Create Topics
15.times do
  Topic.create!(
    name:         RandomData.random_sentence,
    description:  RandomData.random_paragraph
  )
end
topics = Topic.all

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
    user:   users.sample,
    topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
   )

      Post.find_or_create_by(title: "This is a unique Post title", body: "This is a unique Post body")
 end
 posts = Post.all

 # Create Comments
 # #3
 100.times do
   Comment.create!(
 # #4
     user: users.sample,
     post: posts.sample,
     body: RandomData.random_paragraph
   )
   Comment.find_or_create_by(body: "This is a unique comment body")
 end

 admin = User.create!(
   name:     'Admin User',
   email:    'admin@example.com',
   password: 'helloworld',
   role:     'admin'
 )

 # Create a member
 member = User.create!(
   name:     'Member User',
   email:    'member@example.com',
   password: 'helloworld'
 )

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
