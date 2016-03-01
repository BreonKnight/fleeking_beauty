require 'rubygems'
require 'json'
require 'net/http'

module SearchHelper

  # parses and returns urls of JSON hash objects from searchFlickr(place) API response
  def getFlickrURLs(data)
    # JSON hash format returned from searchFlickr(place) API call:
    #
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

    # how to drill down into JSON hash (example):
    #
    # data['photos']['photo'][0]['farm']

    # desired syntax for flickr urls (template):
    #
    # https://farm{farm-id}.staticflickr.com/{server-id}/{id}_{secret}.jpg

    @urls = []  # define instance var array to contain flickr photo urls

    # pushes flickr photo url of each element into @urls array
    data['photos']['photo'].each do |photo|
      farm_id = photo['farm'] # gets farm-id
      server_id = photo['server'] # gets server-id
      id = photo['id']  # gets id
      secret = photo['secret']  #gets secret

      url = "https://farm#{farm_id}.staticflickr.com/#{server_id}/#{id}_#{secret}.jpg"  # formats flickr urls with desired syntax

      @urls << url  # pushes photo url of element into @urls array
    end

    @urls # returns @urls array

  end

  # makes API request to Flickr and returns JSON hash object
  def searchFlickr(place)
    api_key=ENV['FLICKR_KEY'] # sets Flickr key with environment variable

    # concatenates request url
    flickrSearch =
      "https://api.flickr.com/services/rest/?method=flickr.photos.search" +
      "&format=json&nojsoncallback=1" + # sets base url
      "&api_key=#{api_key}" + # sets api_key
      "&content_type=1" + # limits content type to photos only
      "&tags=#{place.name}" + # tag limits returns by place.name
      "&privacy_filter=1"+  # requests only publicly available photos
      "&page=1" + # limits returns to 1 page
      "&per_page=50"  # limits number of returns per-page

    response = Net::HTTP.get_response(URI.parse(flickrSearch))  # GET with dynamic parameter flickrSearch
    data = response.body  # assigns JSON hash object to data
    data = JSON.parse(data) # parses JSON data
    getFlickrURLs(data) # calls function to parse and return urls of data
  end

end
