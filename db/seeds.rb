# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
gym_1 = Gym.create!(name: "Joe's Gym", always_open: true, num_of_platforms: 10) 
gym_2 = Gym.create!(name: "Iron Fitness", always_open: false, num_of_platforms: 25) 

joey = gym_1.crossfitters.create!(name: "Joey", oly_lift: true, age: 25)
roman = gym_1.crossfitters.create!(name: "Roman", oly_lift: false, age: 20)

