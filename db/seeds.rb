# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require_relative 'scrapping/scrap_lechti'
require_relative 'scrapping/scrap_yelp'

puts "=== Cleaning database... ==="

Review.destroy_all
puts "=== Review clean! ==="
Notification.destroy_all
puts "=== Notification clean! ==="
Booking.destroy_all
puts "=== Booking clean! ==="
Slot.destroy_all
puts "=== Slot clean! ==="
Activity.destroy_all
puts "=== Activity clean! ==="
User.destroy_all
puts "=== User clean! ==="

puts "=== Database clean! ==="

puts "=== Adding users... ==="
user1 = User.create(first_name: 'Benjamin', last_name: 'Maureau', email: 'benjamin@com', password: 'azerty', phone_number: "0608450544", birth_date: "1997-11-15")
user1.photo.attach(io: URI.open('https://avatars.githubusercontent.com/u/80259966?v=4'), filename: 'ben.jpeg', content_type: 'image/jpeg')
user1.save
user2 = User.create(first_name: 'Tania', last_name: 'Hajjar', email: 'tania@com', password: 'azerty', phone_number: "0675727589", birth_date: "1997-09-21")
user2.photo.attach(io: URI.open('https://avatars.githubusercontent.com/u/81690176?v=4'), filename: 'tania.jpeg', content_type: 'image/png')
user2.save
user3 = User.create(first_name: 'Robin', last_name: 'Dahan', email: 'robin@com', password: 'azerty', phone_number: "0661681428", birth_date: "1997-10-17")
user3.photo.attach(io: URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1619972134/kjwymhuj4vddmefrsxrx.jpg'), filename: 'robin.jpeg', content_type: 'image/jpeg')
user3.save
user4 = User.create(first_name: 'Louis', last_name: 'Hocquet', email: 'louis@com', password: 'azerty', phone_number: "0786423455", birth_date: "1996-06-04")
user4.photo.attach(io: URI.open('https://avatars.githubusercontent.com/u/50288549?v=4'), filename: 'louis.jpeg', content_type: 'image/jpeg')
user4.save
puts "=== #{User.count} users added! ==="


puts "=== Adding Activity... ==="
puts ">>>>> ON SCRAP LE CHTI <<<<<"
scrap_lechti_v2
puts ">>>>> MERCI LE CHTI ! <<<<<"
scrap_yelp
puts ">>>>> MERCI YELP ! <<<<<"

puts "=== #{Activity.count} activities added! ==="

# puts "=== Adding slots... ==="

activities = Activity.all
activities.each do |activity|
  Slot.create!(
    start_date: "2021-06-29",
    end_date: "2021-06-29",
    max_number_of_people: 4,
    activity_id: activity.id
  )

  Slot.create!(
    start_date: "2021-06-29",
    end_date: "2021-06-29",
    max_number_of_people: 2,
    activity_id: activity.id
  )

  Slot.create!(
    start_date: "2021-09-21",
    end_date: "2022-09-21",
    max_number_of_people: 1,
    activity_id: activity.id
  )
end

puts "=== #{Slot.count} slots added! ==="


puts "=== Adding bookings... ==="

# slots made on the first activity from categ social
slots = Slot.first(3)

booking1 = Booking.create!(
  number_of_people: 2,
  slot_id: slots[0].id,
  user_id: User.last.id
  )

booking2 = Booking.create!(
  number_of_people: 2,
  slot_id: slots[1].id,
  user_id: User.last.id
  )

booking3 = Booking.create!(
  number_of_people: 1,
  slot_id: slots[2].id,
  user_id: User.last.id
  )

puts "=== #{Booking.count} bookings added! ==="

# uncomment above only

############" OLD SEED ##########################"

# puts "=== Cleaning database... ==="

# Activity.destroy_all
# puts "=== Activity clean! ==="

# Notification.destroy_all
# puts "=== Notification clean! ==="

# Booking.destroy_all
# puts "=== Booking clean! ==="

# Review.destroy_all
# puts "=== Review clean! ==="

# User.destroy_all
# puts "=== User clean! ==="

# puts "=== Database clean! ==="

# puts "=== Adding users... ==="
# user1 = User.create(first_name: 'Benjamin', last_name: 'Maureau', email: 'benjamin@com', password: 'azerty', phone_number: "0608450544", birth_date: "1997-11-15")
# user1.photo.attach(io: URI.open('https://avatars.githubusercontent.com/u/80259966?v=4'), filename: 'ben.jpeg', content_type: 'image/jpeg')
# user1.save
# user2 = User.create(first_name: 'Tania', last_name: 'Hajjar', email: 'tania@com', password: 'azerty', phone_number: "0675727589", birth_date: "1997-09-21")
# user2.photo.attach(io: URI.open('https://avatars.githubusercontent.com/u/81690176?v=4'), filename: 'tania.jpeg', content_type: 'image/png')
# user2.save
# user3 = User.create(first_name: 'Robin', last_name: 'Dahan', email: 'robin@com', password: 'azerty', phone_number: "0661681428", birth_date: "1997-10-17")
# user3.photo.attach(io: URI.open('https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1619972134/kjwymhuj4vddmefrsxrx.jpg'), filename: 'robin.jpeg', content_type: 'image/jpeg')
# user3.save
# user4 = User.create(first_name: 'Louis', last_name: 'Hocquet', email: 'louis@com', password: 'azerty', phone_number: "0786423455", birth_date: "1996-06-04")
# user4.photo.attach(io: URI.open('https://avatars.githubusercontent.com/u/50288549?v=4'), filename: 'louis.jpeg', content_type: 'image/jpeg')
# user4.save
# puts "=== #{User.count} users added! ==="


# puts "=== Adding Activity... ==="
# activity1 = Activity.create(
#   name: "Padel tennis",
#   address: "6 Rue Abel Gance 78390 Bois-d’Arcy",
#   indoor: true,
#   category:"sport",
#   price_per_head:"X",
#   contact_email:25,
#   contact_phone_number:100,
#   activity_url:"http://le-padel-club.com/",
#   longitude: 2.3646578788757324,
#   latitude: 48.86328125)

# activity1.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
# activity1.save

# activity2 = Activity.create(
#   name: "Paddle",
#   address: "9 avenue de la tranquillité 78000 Versailles",
#   indoor: true,
#   category:"sport",
#   price_per_head:"30",
#   instructions: "Loulou est le meilleur product owner de France",
#   contact_email:25,
#   contact_phone_number:200,
#   activity_url:"http://le-padel-club.com/",
#   longitude: 2.3646578788757324,
#   latitude: 48.86328125)

# activity2.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
# activity2.save

# activity3 = Activity.create(
#   name: "Cinéma",
#   address: "45 rue de Douai 59000 Lille",
#   indoor: true,
#   category:"sport",
#   price_per_head:"X",
#   contact_email:25,
#   contact_phone_number:300,
#   activity_url:"http://le-padel-club.com/",
#   longitude: 2.3646578788757324,
#   latitude: 48.86328125)

# activity3.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
# activity3.save

# activity4 = Activity.create(
#   name: "Randonnée",
#   address: "72 rue des martyrs de la resistance, 59000 Lille",
#   indoor: true,
#   category:"sport",
#   price_per_head:"X",
#   contact_email:25,
#   contact_phone_number:400,
#   activity_url:"http://le-padel-club.com/",
#   longitude: 2.3646578788757324,
#   latitude: 48.86328125)

# activity4.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
# activity4.save

# activity5 = Activity.create(
#   name: "Pizza",
#   address: "113 Rue Abel Gance 78390 Bois-d’Arcy",
#   indoor: true,
#   category:"social",
#   price_per_head:"X",
#   contact_email:25,
#   contact_phone_number:100,
#   activity_url:"http://le-padel-club.com/",
#   longitude: 2.3646578788757324,
#   latitude: 48.86328125)
# activity5.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
# activity5.save
# puts "=== #{Activity.count} activities added! ==="


# puts "=== Adding slots... ==="

# slot1 = Slot.create!(
#   start_date: "2021-09-21",
#   end_date: "2022-09-21",
#   max_number_of_people: 4,
#   activity_id: activity1.id)

# slot2 = Slot.create!(
#   start_date: "2021-09-21",
#   end_date: "2022-09-21",
#   max_number_of_people: 4,
#   activity_id: activity2.id)


# slot3 = Slot.create!(
#   start_date: "2021-09-21",
#   end_date: "2022-09-21",
#   max_number_of_people: 4,
#   activity_id: activity3.id)

# slot4 = Slot.create!(
#   start_date: "2021-09-21",
#   end_date: "2022-09-21",
#   max_number_of_people: 4,
#   activity_id: activity4.id)

# slot5 = Slot.create!(
#   start_date: "2021-09-21",
#   end_date: "2022-09-21",
#   max_number_of_people: 4,
#   activity_id: activity5.id)

# puts "=== #{Slot.count} slots added! ==="


# puts "=== Adding bookings... ==="

# booking1 = Booking.create!(
#   number_of_people: 2,
#   slot_id: slot1.id,
#   user_id: user1.id
#   )

# booking2 = Booking.create!(
#   number_of_people: 2,
#   slot_id: slot2.id,
#   user_id: user2.id
#   )

# booking3 = Booking.create!(
#   number_of_people: 2,
#   slot_id: slot3.id,
#   user_id: user3.id
#   )

# booking4 = Booking.create!(
#   number_of_people: 2,
#   slot_id: slot4.id,
#   user_id: user4.id
#   )

# booking5 = Booking.create!(
#   number_of_people: 2,
#   slot_id: slot5.id,
#   user_id: user2.id
#   )

# puts "=== #{Booking.count} bookings added! ==="
