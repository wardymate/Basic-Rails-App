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
     post: posts.sample,
     body: RandomData.random_paragraph
   )
   Comment.find_or_create_by(body: "This is a unique comment body")
 end

 # Create Advertisements
 10.times do
 # #1
   Advertisement.create!(
 # #2
     title:  RandomData.random_sentence,
     copy:   RandomData.random_paragraph,
     price:  RandomData.random_integer

   )
 end
 advertisements = Advertisement.all

 # Create Questions
 10.times do
 # #1
   Question.create!(
 # #2
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     resolved:  RandomData.random_boolean

   )
 end
 questions = Question.all

  user = User.first
  user.update_attributes!(
    email: 'charlietarr1@gmail.com', # replace this with your personal email
    password: 'Monkey1988'
  )

 puts "Seed finished"
 puts "#{Topic.count} topics created"
 puts "#{User.count} users created"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
 puts "#{Question.count} questions created"
