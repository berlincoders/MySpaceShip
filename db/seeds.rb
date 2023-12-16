require 'faker'

Spaceship.destroy_all

# Create users
users = []
12.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456"
  )
  users << user
end

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
]

spaceship_image_paths.each do |image_path|
  Spaceship.create!(
    name: Faker::Space.constellation,
    model: Faker::Space.star_cluster,
    description: Faker::Company.catch_phrase,
    daily_rate: rand(1000.0..10_000.0).round(2),
    user: users.sample,
    # Attach the local image to the spaceship
    photo: File.open(image_path, 'rb')
  )
end
