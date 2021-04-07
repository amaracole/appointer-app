require 'faker'
require "open-uri"

puts "=====[ Seeding database ]====="

puts "Cleaning database..."
Shop.destroy_all
User.delete_all
puts "Database cleaned!"

puts "Creating users..."
user1 = User.create!(email: "amara@gmail.com", password: "password", name: "Amara", phone_number: "089123454")
user2 = User.create!(email: "abrar@gmail.com", password: "password", name: "Abrar", phone_number: "089765432")
user3 = User.create!(email: "zaynab@gmail.com", password: "password", name: "Zaynab", phone_number: "089432865")
puts "Users created!"

puts "Creating shops..."
# CATEGORY = %w(Clothing Household Beauty Food Electronics Entertainment)
# NAME = %w(Zara H&M Galeria Oberpollinger Hirmer Kickz Gucci Snipes)
AVAILABILITY = "Mon - Sat: 10:00 - 20:00"

shop1 = Shop.new(
  name: "Zara",
  address: "Neuhauser Str. 33, 80331 München",
  # category: CATEGORY.sample
  category: "Clothing",
  description: "We are open for 'Click & Meet' and 'Click & Collect'!",
  availability: AVAILABILITY,
  phone_number: "089-23 07 74 34",
  capacity: rand(11..25)
)
shop1.user = user1
shop1.save!

shop2 = Shop.new(
  name: "H&M Hannes & Mauritz",
  address: "Kaufingerstr. 24, 80331 München",
  # category: CATEGORY.sample
  category: "Clothing",
  description: "We are open for 'Click & Meet' and 'Click & Collect'!",
  availability: AVAILABILITY,
  phone_number: "089-24 20 92 14",
  capacity: rand(11..25)
)
shop2.user = user1
shop2.save!

shop3 = Shop.new(
  name: "Snipes",
  address: "Neuhauser Str. 3, 80331 München",
  # category: CATEGORY.sample
  category: "Clothing",
  description: "We are open for 'Click & Meet' and 'Click & Collect'!",
  availability: AVAILABILITY,
  phone_number: "089-26 01 84 35",
  capacity: rand(11..25)
)
shop3.user = user2
shop3.save!

shop4 = Shop.new(
  name: "Gucci Store",
  address: "Maximilianstr. 31, 80539 München",
  # category: CATEGORY.sample
  category: "Clothing",
  description: "We are open for 'Click & Meet' and 'Click & Collect'!",
  availability: AVAILABILITY,
  phone_number: "089-13 01 43 10",
  capacity: rand(11..25)
)
shop4.user = user3
shop4.save!

puts "Shops created!"

puts "Attaching shop images..."
file = URI.open("https://res.cloudinary.com/db0g0iarz/image/upload/v1617798556/Appointer/zara_theatinerstr.jpg")
shop1.photo.attach(io: file, filename: "#{shop1.name}.jpg", content_type: "image/jpg")
shop1.save!


file = URI.open("https://res.cloudinary.com/db0g0iarz/image/upload/v1617800275/Appointer/hm_hannes_and_mauritz1234.jpg")
shop2.photo.attach(io: file, filename: "#{shop2.name}.jpg", content_type: "image/jpg")
shop2.save!

file = URI.open("https://res.cloudinary.com/db0g0iarz/image/upload/v1617800222/Appointer/SNIPES_store_gxkybw.jpg")
shop3.photo.attach(io: file, filename: "#{shop3.name}.jpg", content_type: "image/jpg")
shop3.save!

file = URI.open("https://res.cloudinary.com/db0g0iarz/image/upload/v1617805337/Appointer/gucci_store_czcar7.jpg")
shop4.photo.attach(io: file, filename: "#{shop4.name}.jpg", content_type: "image/jpg")
shop4.save!

puts "Shop images attached!"


puts "Attaching user images..."
file = URI.open("https://res.cloudinary.com/db0g0iarz/image/upload/v1617805567/Appointer/amaara_cs3uqp.jpg")
user1.photo.attach(io: file, filename: "#{user1.name}.jpg", content_type: "image/jpg")
user1.save!

file = URI.open("https://res.cloudinary.com/db0g0iarz/image/upload/v1617805565/Appointer/abrar_g16emj.jpg")
user2.photo.attach(io: file, filename: "#{user2.name}.jpg", content_type: "image/jpg")
user2.save!

file = URI.open("https://res.cloudinary.com/db0g0iarz/image/upload/v1617805575/Appointer/zaynab_qjydpo.jpg")
user3.photo.attach(io: file, filename: "#{user3.name}.jpg", content_type: "image/jpg")
user3.save!
puts "User images attached!"

puts "=====[ Finished seeding database ]====="
