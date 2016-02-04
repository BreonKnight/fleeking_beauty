require 'http'
require 'json'
module PlacesHelper


  def get_coordinates(real_name, search_string)
    p "REAL NAME IS #{real_name}"
    show_this = JSON.parse(HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=#{search_string}&key=#{ENV["GMAPS_GEOCODE"]}"))
    lat = show_this['results'][0]['geometry']['location']['lat'].to_s
    lon = show_this['results'][0]['geometry']['location']['lng'].to_s
    new_place = {name: real_name, lat: lat, lon: lon}
    return new_place
  end

  def request_assembly(new_place, coordinates)
    part_1 = "https://maps.googleapis.com/maps/api/distancematrix/json?origins=#{new_place[:lat]},#{new_place[:lon]}|&destinations="
    pt_2 = ""
    part_3 = "&units=imperial&key=#{ENV["GMAPS_MATRIX"]}"
    coordinates.each do | coordinate |
      pt_2 = pt_2 + coordinate + "|"
    end
    part_2 = pt_2.chomp('|')
    request = part_1 + part_2 + part_3
    return request
  end

  def get_distances(search_request)
    response = JSON.parse(HTTP.get("#{search_request}"))
    #format of the json ["rows"][0]['elements']...needs reducing to get distances
    json_reduce = []
    response["rows"][0]['elements'].each do | thing | 
        json_reduce.push(thing)
    end
    reduced = json_reduce.collect{|obj| obj['distance']}
    w = reduced.select{|thing| thing.class == 'Hash'}
    x = reduced.compact
    #getting rid of the miles marker
    y = x.map{|thing| thing['text'].chomp(" mi")}
    numbers = []
    #getting rid of commas and converting to integer
    y.each do | num_string |
      if(num_string.include? ",")
        numbers.push(num_string.gsub!(",", "").to_i)
      else
        numbers.push(num_string.to_i)
      end
    end
    return numbers
  end

  def mileage_checker(limit, miles)
    miles.each do | mile |
      if(mile <= limit)
        return false
      else
        return true
      end 
    end
  end

  def name_cleaner(place)
    a = place.strip
    b = a.gsub(/[^0-9A-Za-z. ]/, "")
    c = b.gsub(/[. ]/, "+")
    return c
  end

end

