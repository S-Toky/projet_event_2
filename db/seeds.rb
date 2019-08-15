# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Event.destroy_all
Attendance.destroy_all

user = []
event = []

5.times do |i|
  user << User.create!(email: "#{Faker::Name.first_name}@yopmail.com", 
    description: Faker::Quotes::Shakespeare.hamlet_quote, 
    first_name: Faker::Name.first_name, 
    last_name: Faker::Name.last_name, 
    password: Faker::Internet.password(min_length: 8)
    )
  puts "user #{i}"
end


5.times do |i|
  event << Event.create!(start_date: Faker::Date.forward,
  duration: 50, 
  title: Faker::Books::Lovecraft.tome, 
  description: Faker::Quote.matz , 
  price: Faker::Number.between(from: 1, to: 1000), 
  location: Faker::Games::LeagueOfLegends.location, 
  user_id: user[rand(4)].id,
  admin_id: user[rand(4)].id
  )
  puts "event #{i}"
end


5.times do |i|
  attendance = Attendance.create!(stripe_customer_id: Faker::Number.number(digits: 10),
  event_id: event[rand(4)].id,
  user_id: user[rand(4)].id
  )
  puts "attendance #{i}"
end



