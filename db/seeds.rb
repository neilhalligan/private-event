# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.create!(name: "neil halligan", email: "neilhalligan@gmail.com")
10.times do |n|
  u.hosted_events.create!(description: "Wezz 0#{n}", date: Faker::Date.between(2.days.ago, Date.tomorrow))
end

10.times do |n|
  User.create!(name: Faker::GameOfThrones.character, email: Faker::Internet.email)
end

u.attended_events << u.hosted_events.take(2)
