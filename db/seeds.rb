# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# place = Place.create([
  # { name: 'Chicago' },
  # { lat: '41.8369' },
  # { lon: '87.6847' }
  # ])

#Fake User Data
User.create([
	email: 'youMad@gmail.com',
	first_name: "Breon",
	last_name: "Knight",
	userName: "ballin",
	password_digest: "haha"
	])

User.create([
	email: 'Is@gmail.com',
	first_name: "Is",
	last_name: "A",
	userName: "italian",
	password_digest: "haha"
	])


#Fake Place data

Place.create([
  name: 'Chicago',
  lat: '41.8369',
  lon: '87.6847'
  ])

#Seeded voting on location
20.times do 
	new_up_vote = Upvote.create
	User.first.upvotes.push new_up_vote
	Place.first.upvotes.push new_up_vote
end

5.times do 
	new_down_vote = Downvote.create
	User.last.downvotes.push new_down_vote
	Place.last.downvotes.push new_down_vote
end