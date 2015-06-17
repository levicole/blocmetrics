require 'faker'

me = User.new(
  name:     'Austin Peay',
  email:    'theaustinpeay@gmail.com',
  password: 'password'
)
me.skip_confirmation!
me.save!

users = User.all

# Create Applications
5.times do
  Application.create!(
    name: Faker::App.name,
    user: users.sample,
    url:  Faker::Internet.url
  )
end
applications = Application.all

# Create Events
500.times do
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