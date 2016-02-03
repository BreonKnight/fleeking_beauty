module PlacesHelper
require 'http'
require 'json'

  def get_coordinates(name)
    p "===> Expecting name to exist #{name} and to be a string #{name.class}"
    show_this = JSON.parse(HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{name}&key=AIzaSyDIL0AuhwH7Lx1duRFYnVUpQsMLPKplBQ8"))
    lat = show_this['results'][0]['geometry']['location']['lat'].to_s
    lon = show_this['results'][0]['geometry']['location']['lng'].to_s
    new_place = {name: name, lat: lat, lon: lon}
    return new_place
  end

end
