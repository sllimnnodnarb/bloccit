require 'random_data'

  5.times do
    Post.create!(
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
    )
  end

  posts = Post.all

  10.times do
    Comment.create!(
      post: posts.sample,
      body: RandomData.random_paragraph
    )
  end

  puts "#{Post.count}"
  1.times do
    Post.find_or_create_by(
      title: "It is well",
      body: "With my soul"
    )
  end
  puts "#{Post.count}"

  if 

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
