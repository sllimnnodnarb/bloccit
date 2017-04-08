require 'random_data'


  5.times do
    Topic.create!(
      name:         RandomData.random_sentence,
      description:  RandomData.random_paragraph
    )
  end
  topics = Topic.all

  5.times do
    Post.create!(
      topic: topics.sample,
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph
    )
  end

  posts = Post.all

  5.times do
    Comment.create!(
      post: posts.sample,
      body: RandomData.random_paragraph
    )
  end

  puts "#{Post.count}"
  3.times do
    Post.find_or_create_by(
      title: "It is well",
      body: "With my soul"
    )
  end
  puts "#{Post.count}"

  5.times do
    Question.create!(
      title:  RandomData.random_sentence,
      body:   RandomData.random_paragraph,
      resolved: false
    )
  end


puts "#{Topic.count} topics created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Question.count} questions created"
puts "Seed finished"
puts "Some seeds fell beside the road, and the birds came and ate them up..."
