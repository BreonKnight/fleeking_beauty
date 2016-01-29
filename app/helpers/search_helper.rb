require 'flickraw'

module SearchHelper

  def search(place)
    # search for pictures taken within 50 miles of a place

    FlickRaw.api_key="27a19bcef1138ae6bb69dc5aba22c94e"
    # ? FlickRaw.shared_secret="..."

    place = flickr.places.find :query => place.name
    latitude = place[0]['lat'].to_f
    longitude = place[0]['lon'].to_f

    # within 50 miles of a place using a bbox
    radius = 1
    args = {}
    args[:bbox] = "#{longitude - radius},#{latitude - radius},#{longitude + radius},#{latitude + radius}"

    args[:accuracy] = 1 # ? the default is street only granularity [16], which most images aren't...
    discovered_pictures = flickr.photos.search args
    discovered_pictures.each{|p| url = FlickRaw.url p; puts url}
  end

end