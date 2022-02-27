require 'faker'
require "open-uri"

puts 'Removing the restaurants...'
Restaurant.destroy_all

puts 'Creating 5 restaurants'

5.times do
  file = URI.open("https://loremflickr.com/320/240/restaurant")
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
  restaurant.photo.attach(io: file, filename: 'restaurant_pic.png', content_type: 'image/png')
  if restaurant.save!
    p '*'
  else
    puts 'image upload failed'
  end
end
puts "...created 5 restaurants!"
