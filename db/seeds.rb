require 'faker'

# Create Users
1.times do
  user = User.new(
    name:     Faker::Name.name,
    email:    Faker::Internet.email,
    password: Faker::Lorem.characters(8)
  )
  user.skip_confirmation!
  user.save!
end
users = User.all

me = User.new(
  name:     'Austin Peay',
  email:    'theaustinpeay@gmail.com',
  password: 'password'
)
me.skip_confirmation!
me.save!

# Create Applications
8.times do
  Application.create!(
    name: Faker::App.name,
    user: users.sample,
    url:  Faker::Internet.url
  )
end
applications = Application.all

# Create Events
60.times do
  event = Event.create!(
    name:        Faker::Hacker.ingverb,
    # user:        users.sample,
    application: applications.sample
  )
end

puts "Seed finished"
puts "#{User.count} users created."
puts "#{Application.count} applications registered."
puts "#{Event.count} events tracked."