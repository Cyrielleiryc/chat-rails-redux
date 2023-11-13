# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Destroy messages, users and channels (in that order)
puts 'Destroy messages, users and channels :'
Message.destroy_all
User.destroy_all
Channel.destroy_all
puts 'all gone!'
puts '------------'

# Create some channels (general, paris, react for instance)
puts 'Creating channels'
['general', 'paris', 'react'].each do |channel|
  Channel.create(name: channel)
end
puts '3 channels created!'
puts '------------'

# Create some users (needs email / password)
puts 'Creating users'
['cyrielle@gmail.com', 'paul@gmail.com', 'mike@gmail.com'].each do |user|
  User.create(email: user, password: "123456")
end
puts '3 users created!'
puts '------------'

# Create some messages in several channels.
puts 'Creating messages'
channels = Channel.all
users = User.all
users.each do |user|
  channels.each do |channel|
    new_message = Message.new(user: user, channel: channel)
    new_message.content = "hello from #{new_message.user.email[0..-9]} in #{new_message.channel.name} !!"
    new_message.save
  end
end
puts 'Some messages created!'
puts '------------'

if User.all.size > 2 && Channel.all.size > 2 && Message.all.size > 2
  puts 'Seeds are successfully done !'
  puts '------------'
end
