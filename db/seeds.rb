require 'faker'

puts 'Removing the restaurants...'
Restaurant.destroy_all

puts 'Creating 5 restaurants'

5.times do
  Restaurant.create!(
    name: Faker::Restaurant.name,
    address: Faker::Address.street_address,
    phone_number: Faker::PhoneNumber.phone_number,
    category: Restaurant::CATEGORIES.sample
  )
end
puts "...created 5 restaurants!"
