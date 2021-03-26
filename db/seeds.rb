require 'faker'
require "open-uri"

puts "=====[ Seeding database ]====="

puts "Cleaning database..."
Shop.destroy_all
User.delete_all
puts "Database cleaned!"

puts "Creating users..."
User.create!(email: "amara@gmail.com", password: "password", name: "Amara", phone_number: 089123454)
puts "Users created!"

puts "Creating shops..."
# CATEGORY = %w(Clothing Household Beauty Food Electronics Entertainment)
NAME = %w(Zara H&M Galeria Oberpollinger Hirmer Kickz Gucci Snipes)
AVAILABILITY = "Mon - Sat: 10:00 - 20:00"

8.times do
  Shop.create(
    name: NAME.sample,
    address: Faker::Address.street_address,
    # category: CATEGORY.sample
    category: "Clothing",
    description: Faker::GreekPhilosophers.quote,
    availability: AVAILABILITY,
    phone_number: Faker::PhoneNumber.cell_phone_in_e164,
    capacity: rand(11..25)
  )
end

puts "Shops created!"

puts "=====[ Finished seeding database ]====="
