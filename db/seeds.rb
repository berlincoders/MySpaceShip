require 'faker'
<<<<<<< HEAD
=======

# user = User.create(
#   email: "bla@blah.com",
#   password: "123456"
# )
>>>>>>> 0de4d33a7019c423c1321a48f611e66a9ba13250

Spaceship.destroy_all

<<<<<<< HEAD
# Create users
users = []
12.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456"
  )
  users << user
end

# Create spaceships with random user_id
spaceship_image_paths = [
  "app/assets/images/spaceships/spaceship_01.jpg"
=======
spaceship_image_paths = [
  "app/assets/images/spaceships/spaceship_01.jpg",
  "app/assets/images/spaceships/spaceship_02.jpg",
  "app/assets/images/spaceships/spaceship_03.jpg",
  "app/assets/images/spaceships/spaceship_04.jpg",
  "app/assets/images/spaceships/spaceship_05.jpg",
  "app/assets/images/spaceships/spaceship_06.jpg",
  "app/assets/images/spaceships/spaceship_07.jpg",
  "app/assets/images/spaceships/spaceship_08.jpg",
  "app/assets/images/spaceships/spaceship_09.jpg",
  "app/assets/images/spaceships/spaceship_10.jpg",
  "app/assets/images/spaceships/spaceship_11.jpg",
  "app/assets/images/spaceships/spaceship_12.jpg"
>>>>>>> 0de4d33a7019c423c1321a48f611e66a9ba13250
]

spaceship_image_paths.each do |image_path|
  new_spaceship = Spaceship.create(
    name: Faker::Space.constellation,
    model: Faker::Space.star_cluster,
    description: Faker::Company.catch_phrase,
    daily_rate: rand(1000.0..10_000.0).round(2),
<<<<<<< HEAD
    user: users.sample
=======
    # Assign a user_id to the spaceship, adjust as needed
    user_id: User.all.pluck(:id).sample
>>>>>>> 0de4d33a7019c423c1321a48f611e66a9ba13250
  )

  # Attach the local image to the spaceship
  File.open(image_path, 'rb') do |file|
    new_spaceship.photo.attach(io: file, filename: File.basename(image_path), content_type: "image/jpg")
  end
<<<<<<< HEAD
=======

  new_spaceship.save
>>>>>>> 0de4d33a7019c423c1321a48f611e66a9ba13250
end

# Update foreign key references in spaceships
Spaceship.where(user_id: 37).update_all(user_id: nil)
