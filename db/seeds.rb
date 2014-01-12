25.times do |i|
  i = i.next
  Article.create!(title: "Article #{ i }")
  Post.create!(title: "Post #{ i }")
  Photo.create!(name: "Photo #{ i }")
  print "."
end

articles = Article.all
posts    = Post.all
photos   = Photo.all

puts
puts "Objects created"
puts

15.times do |i|
  i = i.next
  collection = Collection.create!(title: "Collection #{ i }")

  (12..30).to_a.sample.times do
    collection.collection_items.create(item: articles.sample)
    collection.collection_items.create(item: posts.sample)
    collection.collection_items.create(item: photos.sample)
  end

  print "."
end

puts
puts "Collections created"
puts