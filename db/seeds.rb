require 'http'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
# place = Place.create([
  # { name: 'Chicago' },
  # { lat: '41.8369' },
  # { lon: '87.6847' }
  # ])
User.destroy_all
Place.destroy_all
Upvote.destroy_all
Downvote.destroy_all 

#Fake User Data
User.create(
	email: 'youMad@gmail.com',
	first_name: "Breon",
	last_name: "Knight",
	userName: "ballin",
	password_digest: "haha"
	)

User.create(
	email: 'Is@gmail.com',
	first_name: "Is",
	last_name: "A",
	userName: "italian",
	password_digest: "haha"
	)


#Fake Place data
more_places = ["San Francisco", "New York", "Tokyo", "Hong Kong", "Los Angeles", "Berlin", "Cairo", "Santiago", "Perth", "Seoul", "Joshua Tree National Park", "Vladivostok", "Bahia", "Davenport", "Worcester", "Detroit", "Singapore", "Lagos", "Krabi", "Bucharest"]

Place.create(
  name: 'Chicago',
  lat: '41.8369',
  lon: '87.6847'
  )

Place.create(
  name: 'Baltimore',
  lat: '39.2833',
  lon: '76.6167'
  )

def whitespace_eliminator(name)
  if(name.include? " ")
    search_name = name.strip
    search_name = search_name.gsub /\s/, '+'
    return search_name
  else
    return name
  end
end

def geocode(name, search_name)
  grab_this = JSON.parse(HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{search_name}&key=AIzaSyDIL0AuhwH7Lx1duRFYnVUpQsMLPKplBQ8"))
  lat = grab_this['results'][0]['geometry']['location']['lat'].to_s
  lon = grab_this['results'][0]['geometry']['location']['lng'].to_s
  new_place = {name: name, lat: lat, lon: lon}
  return new_place
end

more_places.each do | place |
  search_string = whitespace_eliminator(place)
  geocoded_place = geocode(place, search_string)
  Place.create(geocoded_place)
end

#Seeded voting on location
20.times do 
	new_up_vote = Upvote.create
	User.first.upvotes.push new_up_vote
	Place.last.upvotes.push new_up_vote
end

10.times do 
	news_up_vote = Upvote.create
	User.first.upvotes.push news_up_vote
	Place.last.upvotes.push news_up_vote
end

5.times do 
	new_down_vote = Downvote.create
	User.first.downvotes.push new_down_vote
	Place.first.downvotes.push new_down_vote
end