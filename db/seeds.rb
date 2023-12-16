require 'faker'

User.destroy_all
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

# Create spaceships with random user_id
spaceship_image_paths = [
  "app/assets/images/spaceships/spaceship_01.jpg"
]

spaceship_image_paths.each do |image_path|
  new_spaceship = Spaceship.create(
    name: Faker::Space.constellation,
    model: Faker::Space.star_cluster,
    description: Faker::Company.catch_phrase,
    daily_rate: rand(1000.0..10_000.0).round(2),
    user: users.sample
  )

  # Attach the local image to the spaceship
  File.open(image_path, 'rb') do |file|
    new_spaceship.photo.attach(io: file, filename: File.basename(image_path), content_type: "image/jpg")
  end
end

# Update foreign key references in spaceships
Spaceship.where(user_id: 37).update_all(user_id: nil)
