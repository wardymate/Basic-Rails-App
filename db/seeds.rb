include RandomData

 # Create Posts
 50.times do
 # #1
   Post.create!(
 # #2
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

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
