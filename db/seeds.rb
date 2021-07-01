# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'
require 'date'
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
puts ">>>>> ON TAPE DANS L'API YELP ! <<<<<"
scrap_yelp
puts ">>>>> MERCI YELP ! <<<<<"

puts "=== #{Activity.count} activities added! ==="

puts "=== Adding bookings to review... ==="

######### Demo Activity to review // Notifs #########################
# Change this line to the yesterday date so that we have review for notifs
dayOfToday = Date.today
dayOfYesterday = dayOfToday - 1

# dayOfYesterday = "2021-06-30"
# dayOfToday = "2021-07-01"
# Louis
demoActivityToReviewLouis = Activity.first
demoSlotLouis = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityToReviewLouis.id
)

demoBookingToReviewLouis = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotLouis.id,
  user_id: user4.id
)
demoActivityToReviewLouis2 = Activity.first(5).last
demoSlotLouis2 = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityToReviewLouis2.id
)

demoBookingToReviewLouis2 = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotLouis2.id,
  user_id: user4.id
)
# Benjamin
demoActivityToReviewBenjamin = Activity.first(2).last
demoSlotBenjamin = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityToReviewBenjamin.id
)

demoBookingToReviewBenjamin = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotBenjamin.id,
  user_id: user1.id
)
demoActivityToReviewBenjamin2 = Activity.first(6).last
demoSlotBenjamin2 = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityToReviewBenjamin2.id
)

demoBookingToReviewBenjamin2 = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotBenjamin2.id,
  user_id: user1.id
)
# Robin
demoActivityToReviewRobin = Activity.first(3).last
demoSlotRobin = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityToReviewRobin.id
)

demoBookingToReviewRobin = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotRobin.id,
  user_id: user3.id
)
demoActivityToReviewRobin2 = Activity.first(7).last
demoSlotRobin2 = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityToReviewRobin2.id
)

demoBookingToReviewRobin2 = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotRobin2.id,
  user_id: user3.id
)

# Tania
demoActivityToReviewTania = Activity.first(4).last
demoSlotTania = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityToReviewTania.id
)

demoBookingToReviewTania = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotTania.id,
  user_id: user2.id
)
demoActivityToReviewTania2 = Activity.first(8).last
demoSlotTania2 = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityToReviewTania2.id
)

demoBookingToReviewTania2 = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotTania2.id,
  user_id: user2.id
)

puts "=== #{Booking.count} bookings to review added! ==="

######### Demo Activity to review // Notifs #########################

puts "=== Adding 3 slots to each activity... ==="

activities = Activity.all[11..-1]
activities.each do |activity|
  Slot.create!(
    start_date: dayOfToday,
    end_date: dayOfToday,
    max_number_of_people: 4,
    activity_id: activity.id
  )

  Slot.create!(
    start_date: dayOfToday,
    end_date: dayOfToday,
    max_number_of_people: 2,
    activity_id: activity.id
  )

  Slot.create!(
    start_date: dayOfToday,
    end_date: dayOfToday,
    max_number_of_people: 1,
    activity_id: activity.id
  )
end

puts "=== #{Slot.count} slots added! ==="


puts "=== Adding bookings... ==="

# slots made on the first activity from categ social
# slots = Slot.first(15).last(3)

demoActivityBenjamin3 = Activity.first(9).last
demoActivityRobin3 = Activity.first(10).last
demoActivityTania3 = Activity.first(11).last

demoSlotBenjamin3 = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityBenjamin3.id
)
demoSlotRobin3 = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityRobin3.id
)
demoSlotTania3 = Slot.create!(
  start_date: dayOfYesterday,
  end_date: dayOfYesterday,
  max_number_of_people: 4,
  activity_id: demoActivityTania3.id
)


booking1 = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotTania3.id,
  user_id: user2.id
  )

booking2 = Booking.create!(
  number_of_people: 2,
  slot_id: demoSlotBenjamin3.id,
  user_id: user1.id
  )

booking3 = Booking.create!(
  number_of_people: 1,
  slot_id: demoSlotRobin3.id,
  user_id: user3.id
  )

puts "=== #{Booking.count - 11} bookings added! ==="

puts "=== Adding reviews... ==="

review1 = Review.create!(
  rating: 4.5,
  content: "Je ne connaissais pas et j'ai adoré !!",
  booking_id: booking3.id
)

review2 = Review.create!(
  rating: 4,
  content: "Merci Randomize pour ce concept génial !",
  booking_id: booking2.id
)

review3 = Review.create!(
  rating: 5,
  content: "4ème soirée Randomize et toujours aussi agréablement surprise !",
  booking_id: booking1.id
)

puts "=== #{Review.count} reviews added! ==="

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
