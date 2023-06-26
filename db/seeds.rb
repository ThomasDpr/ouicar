puts "Cleaning database..."

User.destroy_all

denver = User.create!(first_name: "Denver",last_name: "Falbala", email: "denver@mail.com", password: "secret")
file = File.open(Rails.root.join("db/picture/denver.jpg"))
denver.picture.attach(io: file, filename: "denver.jpg", content_type: "image/jpeg")

denver.save!
