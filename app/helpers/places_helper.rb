module PlacesHelper
require 'http'
require 'json'

  def get_coordinates(name)
    p "===> Expecting name to exist #{name} and to be a string #{name.class}"
    show_this = JSON.parse(HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{name}&key=geocodekey.edu"))
    lat = show_this['results'][0]['geometry']['location']['lat'].to_s
    lon = show_this['results'][0]['geometry']['location']['lng'].to_s
    new_place = {name: name, lat: lat, lon: lon}
    return new_place
  end

  def compare_coordinates(new_place)
    # stored_place
    distance = JSON.parse(HTTP.get("https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{new_place[:lat]},#{new_place[:lon]}|&destinations=41.43206,-81.38992&units=imperial&key=www.yourdistanceapikeyhere.edu"))
    #{new_place[:lat]},#{new_place[:lon]}
    print "===> expecting a blob of distance info #{distance}"
end
distance = IzaSyAgvdKz8uVUUjakmnDwiQGG1KZApTXSIOI
geocodekey = AIzaSyDIL0AuhwH7Lx1duRFYnVUpQsMLPKplBQ8
