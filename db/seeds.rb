# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def create_fights
  10.times do
    Combat.create( name: Faker::Games::StreetFighter.stage , description: Faker::GreekPhilosophers.quote)
  end
  puts '10 fights created by seed'
end

def create_admin
  User.create!(pseudo: "admin1", email: "admin@1.fr", password: "111111", admin: true)
  puts 'Admin created by seed'
end

def destroy_all_models
  User.destroy_all
  Combat.destroy_all
  puts "Users & combats destroyed"
end

def create_users
  10.times do
    User.create!(pseudo: Faker::Name.name, email: Faker::Internet.email, password: "111111", admin: false)
  end
  puts '10 users created by seed'
end

destroy_all_models
create_fights
create_users
create_admin
