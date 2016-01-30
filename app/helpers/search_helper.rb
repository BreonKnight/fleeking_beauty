require 'rubygems'
require 'json'
require 'net/http'
 
module SearchHelper

  def getFlickrURLs(data)
    #format received:
    # {"photos"=>
    #   {
    #     "page"=>1, 
    #     "pages"=>18147, 
    #     "perpage"=>5, 
    #     "total"=>"90732", 
    #     "photo"=>[{
    #       "id"=>"24383913280", 
    #       "owner"=>"130749742@N02", 
    #       "secret"=>"272138f259", 
    #       "server"=>"1592", 
    #       "farm"=>2, 
    #       "title"=>"2016-01-28_09-12-05", 
    #       "ispublic"=>1, "isfriend"=>0, "isfamily"=>0
    #     }]
    #   }, 
    #   "stat"=>"ok"
    # }

    #How to drill down into hash received
    # data['photos']['photo'][0]['farm']

    #format required to grab flickr urls
    # https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg
    
    @urls = []
  
    data['photos']['photo'].each do |photo|
      @farm_id = photo['farm']
      @server_id = photo['server']
      @id = photo['id']
      @secret = photo['secret']

      url = "https://farm#{@farm_id}.staticflickr.com/#{@server_id}/#{@id}_#{@secret}.jpg"
      
      @urls << url
    end

    @urls

  end

<<<<<<< HEAD
  def search(place) 
    @api_key=ENV['FLICKR_KEY']
    @lat = place.lat.to_f
    @lon = place.lon.to_f
    flickrSearch = "https://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=#{@api_key}&lat=#{@lat}&lon=#{@lon}&format=json&nojsoncallback=1&page=1&per_page=5"
=======
  def searchFlickr(place) 
    @api_key=""
    # using coordinates as queries limits the search too much
    # @lat = place.lat.to_f
    # @lon = place.lon.to_f
    flickrSearch = "https://api.flickr.com/services/rest/?method=flickr.photos.search" +
    "&format=json&nojsoncallback=1" +
    "&api_key=#{@api_key}" +
    # limits results to photos only
    "&content_type=1" +
    # using tags to limit search to place name and outdoor
    "&tags=outdoor,+#{place.name}" +
    # boolean AND for tags
    "&tag_mode=all" +
    "&page=1" +
    "&per_page=20"
>>>>>>> 9f37cd84ccca8351bb90f00eb9540ea4de2c77df
    response = Net::HTTP.get_response(URI.parse(flickrSearch))
    data = response.body
    data = JSON.parse(data)
    getFlickrURLs(data)
  end

end