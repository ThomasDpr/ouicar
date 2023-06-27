require 'colorize'

puts 'Cleaning database...'

Booking.destroy_all
Car.destroy_all
User.destroy_all

def create_user(first_name, last_name, email, password, photo_path)
  puts ''
  print "🙋🏻‍♂️ - #{first_name} #{last_name} :"

  user = User.find_or_initialize_by(email: email) do |user|
    user.first_name = first_name
    user.last_name = last_name
    user.email = email
    user.password = password
  end

  file = File.open(Rails.root.join(photo_path))
  user.photo.attach(io: file, filename: 'avatar.jpg', content_type: 'image/jpg')
  user.save!

  puts ' Successfully created ! ✅'.green
  user
end

def create_car(brand, description, color, price_per_day, owner, picture_path)
  puts ''
  print "🚗 - #{brand} :"

  car = Car.new(
    brand: brand,
    description: description,
    color: color,
    price_per_day: price_per_day,
    owner: owner
  )

  file = File.open(Rails.root.join(picture_path))
  car.picture.attach(io: file, filename: 'car.jpg', content_type: 'image/jpg')
  car.save!

  puts ' Successfully created ! ✅'.green
end

def create_booking(start_date, end_date, total_price, user, car)
  puts ''
  print "📅 - Booking for #{user.first_name} on #{car.brand} :"

  booking = Booking.find_or_create_by!(user: user, car: car, start_date: start_date, end_date: end_date) do |booking|
    booking.total_price = total_price
    booking.user = user
    booking.car = car
  end

  puts ' Successfully created ! ✅'.green
end

puts ''
puts '-------------------------'
puts "------- #{'USERS'.green} -----------"
puts '-------------------------'

puts ''
puts '⏳ - Creating users...'
puts ''

denver = create_user(
  'Denver',
  'Falbala',
  'denver@gmail.com',
  'secret',
  'db/picture/denver.jpg'
)

leona = create_user(
  'Leona',
  'Helmsworth',
  'leona@gmail.com',
  'secret',
  'db/picture/leona_helmsworth.jpg'
)

seyfried = create_user(
  'Seyfried',
  'Gonzalez',
  'seyfried@gmail.com',
  'secret',
  'db/picture/seyfried_gonzalez.jpg'
)

# puts "Denver object: #{denver.inspect}"
# puts "Denver is a User: #{denver.is_a?(User)}"
# puts "Denver has a photo: #{denver.photo.attached?}"
# puts "Denver's photo url: #{denver.photo.url}"


puts ''
puts '-------------------------'
puts "------- #{'CARS'.red} -----------"
puts '-------------------------'

puts ''
puts '⏳ - Creating cars...'
puts ''

create_car(
  'Tesla Model S',
  'Une superbe Tesla Model S.',
  'Noir',
  150,
  denver,
  'db/picture/tesla_model_s.jpg'
)
