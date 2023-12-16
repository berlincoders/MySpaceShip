require 'faker'

# user = User.create(
#   email: "bla@blah.com",
#   password: "123456"
# )
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
  new_spaceship = Spaceship.create(
    name: Faker::Space.constellation,
    model: Faker::Space.star_cluster,
    description: Faker::Company.catch_phrase,
    daily_rate: rand(1000.0..10_000.0).round(2),

    user: users.sample
    # Assign a user_id to the spaceship, adjust as needed
    user_id: User.all.pluck(:id).sample
  )

  # Attach the local image to the spaceship
  File.open(image_path, 'rb') do |file|
    new_spaceship.photo.attach(io: file, filename: File.basename(image_path), content_type: "image/jpg")
  end


  new_spaceship.save

end
