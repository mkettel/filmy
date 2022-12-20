# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

puts "Destroying Users"
Camera.destroy_all
User.destroy_all


puts "Creating new Users"
5.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    username: Faker::Name.middle_name,
    email: Faker::Internet.email,
    password: "123456"
  )
  user.save
  puts "Created #{user.first_name}"
end

@owner = User.all

@camera = [
  "Contax G2",
  "Leica M7",
  "Nikon F4s",
  "Canon EOS 1V",
  "Canon AE-1",
  "Canon A-1"
]
@year = [
  1978, 1980, 1995, 1992, 1999
]

puts "Creating Cameras"
7.times do
  camera = Camera.new(
    user_id: @owner.sample.id,
    model: @camera.sample,
    year: Faker::Number.between(from: 1970, to: 1999)
  )
  camera.save
  puts "Created #{camera.model}"
end
