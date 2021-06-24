# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts "=== Cleaning database... ==="

Activity.destroy_all
puts "=== Activity clean! ==="
Slot.destroy_all
puts "=== Slot clean! ==="
Review.destroy_all
puts "=== Review clean! ==="
Notification.destroy_all
puts "=== Notification clean! ==="
Booking.destroy_all
puts "=== Booking clean! ==="
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
activity1 = Activity.create(
  name: "Padel tennis",
  address: "6 Rue Abel Gance 78390 Bois-d’Arcy",
  indoor: true,
  category:"sport",
  price_per_head:"X",
  contact_email:25,
  contact_phone_number:100,
  activity_url:"http://le-padel-club.com/",
  longitude: 2.3646578788757324,
  latitude: 48.86328125)

activity1.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
activity1.save

activity2 = Activity.create(
  name: "Paddle",
  address: "9 avenue de la tranquillité 78000 Versailles",
  indoor: true,
  category:"sport",
  price_per_head:"30",
  contact_email:25,
  contact_phone_number:200,
  activity_url:"http://le-padel-club.com/",
  longitude: 2.3646578788757324,
  latitude: 48.86328125)

activity2.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
activity2.save

activity3 = Activity.create(
  name: "Cinéma",
  address: "45 rue de Douai 59000 Lille",
  indoor: true,
  category:"sport",
  price_per_head:"X",
  contact_email:25,
  contact_phone_number:300,
  activity_url:"http://le-padel-club.com/",
  longitude: 2.3646578788757324,
  latitude: 48.86328125)

activity3.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
activity3.save

activity4 = Activity.create(
  name: "Randonnée",
  address: "72 rue des martyrs de la resistance, 59000 Lille",
  indoor: true,
  category:"sport",
  price_per_head:"X",
  contact_email:25,
  contact_phone_number:400,
  activity_url:"http://le-padel-club.com/",
  longitude: 2.3646578788757324,
  latitude: 48.86328125)

activity4.photos.attach(io: URI.open('https://www.sportweek.fr/wp-content/uploads/2018/01/padel-1.jpg'), filename: 'X.jpg', content_type: 'image/jpg')
activity4.save

activity5 = Activity.create(
  name: "Pizza",
  address: "113 Rue Abel Gance 78390 Bois-d’Arcy",
  indoor: true,
  category:"social",
  price_per_head:"X",
  contact_email:25,
  contact_phone_number:100,
  activity_url:"http://le-padel-club.com/",
  longitude: 2.3646578788757324,
  latitude: 48.86328125)
#activity5.save
puts "=== #{Activity.count} activities added! ==="


puts "=== Adding slots... ==="

slot1 = Slot.create!(
  start_date: "2021-09-21",
  end_date: "2022-09-21",
  max_number_of_people: 4,
  activity_id: activity1.id)

slot2 = Slot.create!(
  start_date: "2021-09-21",
  end_date: "2022-09-21",
  max_number_of_people: 4,
  activity_id: activity2.id)


slot3 = Slot.create!(
  start_date: "2021-09-21",
  end_date: "2022-09-21",
  max_number_of_people: 4,
  activity_id: activity3.id)

slot4 = Slot.create!(
  start_date: "2021-09-21",
  end_date: "2022-09-21",
  max_number_of_people: 4,
  activity_id: activity4.id)

slot5 = Slot.create!(
  start_date: "2021-09-21",
  end_date: "2022-09-21",
  max_number_of_people: 4,
  activity_id: activity5.id)

puts "=== #{Slot.count} slots added! ==="


puts "=== Adding bookings... ==="

booking1 = Booking.create!(
  number_of_people: 2,
  slot_id: slot1.id,
  user_id: user1.id
  )

booking2 = Booking.create!(
  number_of_people: 2,
  slot_id: slot2.id,
  user_id: user2.id
  )

booking3 = Booking.create!(
  number_of_people: 2,
  slot_id: slot3.id,
  user_id: user3.id
  )

booking4 = Booking.create!(
  number_of_people: 2,
  slot_id: slot4.id,
  user_id: user4.id
  )

booking5 = Booking.create!(
  number_of_people: 2,
  slot_id: slot5.id,
  user_id: user2.id
  )

puts "=== #{Booking.count} bookings added! ==="


# create_table "bookings", force: :cascade do |t|
#     t.integer "number_of_people"
#     t.bigint "slot_id", null: false
#     t.bigint "user_id", null: false
#     t.datetime "created_at", precision: 6, null: false
#     t.datetime "updated_at", precision: 6, null: false
#     t.index ["slot_id"], name: "index_bookings_on_slot_id"
#     t.index ["user_id"], name: "index_bookings_on_user_id"
#   end


# boat1.photo.attach(io: URI.open('https://images.unsplash.com/photo-1586364312368-3d61a0ec826d?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHNhaWxib2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'), filename: 'X.jpg', content_type: 'image/jpg')
# boat1.save
# boat2 = Boat.create(title: "Best boat ever had",category:"🚤 motorboat",brand:"Beneteau",location:"Martigues", length:12,price_per_day:100,capacity:5, building_year:2012, user_id: user2.id)
# boat2.photo.attach(io: URI.open('https://images.unsplash.com/photo-1564128247026-ea3094dc46e3?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NzZ8fG1vdG9yYm9hdHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'), filename: 'X.jpg', content_type: 'image/jpg')
# boat2.save
# boat3 = Boat.create(title: "Sail this wonder",category:"⛵ sailboat",brand:"X",location:"Santorin", length:45,price_per_day:150,capacity:15, building_year:2016, user_id: user3.id)
# boat3.photo.attach(io: URI.open('https://images.unsplash.com/photo-1540946485063-a40da27545f8?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c2FpbGJvYXR8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'), filename: 'X.jpg', content_type: 'image/jpg')
# boat3.save
# boat4 = Boat.create(title: "Enjoy the sea with me",category:"🚤 motorboat",brand:"Jeanneau",location:"Cagliari", length:10,price_per_day:80,capacity:7, building_year:2011, user_id: user4.id)
# boat4.photo.attach(io: URI.open('https://images.unsplash.com/photo-1560251180-7142bcc49648?ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8bW90b3Jib2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'), filename: 'X.jpg', content_type: 'image/jpg')
# boat4.save
# boat5 = Boat.create(title: "Top boat!",category:"⛵ sailboat",brand:"Beneteau",location:"20200 Bastia", length:20,price_per_day:200,capacity:10, building_year:2018, user_id: user1.id)
# boat5.photo.attach(io: URI.open('https://images.unsplash.com/photo-1566938089258-932794f51c63?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NjJ8fHNhaWxib2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'), filename: 'X.jpg', content_type: 'image/jpg')
# boat5.save
# boat6 = Boat.create(title: "Travel around with me",category:"🚤 motorboat",brand:"Jeanneau",location:"port de Marseille", length:15,price_per_day:120,capacity:6, building_year:2009, user_id: user2.id)
# boat6.photo.attach(io: URI.open('https://images.unsplash.com/photo-1597276103002-1eaf7eef4e4e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8bW90b3Jib2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'), filename: 'X.jpg', content_type: 'image/jpg')
# boat6.save
# boat7 = Boat.create(title: "Sail a great boat",category:"⛵ sailboat",brand:"X",location:"Royan", length:32,price_per_day:250,capacity:12, building_year:2007, user_id: user3.id)
# boat7.photo.attach(io: URI.open('https://images.unsplash.com/photo-1567882003425-ae0e029d6e82?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NTJ8fHNhaWxib2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'), filename: 'X.jpg', content_type: 'image/jpg')
# boat7.save
# boat8 = Boat.create(title: "Enjoy your holiday on me",category:"🚤 motorboat",brand:"Dufour",location:"Ibiza", length:8,price_per_day:90,capacity:5, building_year:2013, user_id: user4.id)
# boat8.photo.attach(io: URI.open('https://images.unsplash.com/photo-1567369244263-8f45293b2178?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bW90b3Jib2F0fGVufDB8fDB8fA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60'), filename: 'X.jpg', content_type: 'image/jpg')
# boat8.save
# puts "=== #{Boat.count} boats added! ==="

# puts "=== Adding bookings... ==="
# Booking.create(start_date: Date.today, end_date: Date.today + 7, user:  user1, boat: boat2)
# Booking.create(start_date: Date.today, end_date: Date.today + 7, user:  user1, boat: boat3)
# Booking.create(start_date: Date.today, end_date: Date.today + 7, user:  user1, boat: boat4)
# Booking.create(start_date: Date.today, end_date: Date.today + 7, user:  user2, boat: boat3)
# Booking.create(start_date: Date.today, end_date: Date.today + 7, user:  user3, boat: boat4)
# Booking.create(start_date: Date.today, end_date: Date.today + 7, user:  user4, boat: boat1)
# puts "=== #{User.count} bookings added! ==="
