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

 # Create Advertisements
 10.times do
 # #1
   Advertisement.create!(
 # #2
     title:  RandomData.random_sentence,
     copy:   RandomData.random_paragraph,
     price:  RandomData.random_integer

   )

      Advertisement.find_or_create_by(title: "This is a unique Advertisement title", copy: "This is a unique Advertisement copy", price: "This is a unique Advertisement price")
 end
 advertisements = Advertisement.all

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} advertisements created"
