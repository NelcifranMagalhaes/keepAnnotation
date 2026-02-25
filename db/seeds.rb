# Clear existing annotations
Annotation.destroy_all

# Create 20 annotations
20.times do |i|
  Annotation.create!(
    title: "Annotation #{i + 1}",
    content: "This is the content for annotation #{i + 1}. " +
             "Lorem ipsum dolor sit amet, consectetur adipiscing elit. " +
             "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
  )
end

puts "Created 20 annotations!"
