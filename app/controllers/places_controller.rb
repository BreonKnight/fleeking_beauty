class PlacesController < ApplicationController
  require 'http'
  require 'json'

  def index
    @places = Place.all
  end

  def new
    show_this = JSON.parse(HTTP.get("https://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&key=AIzaSyDIL0AuhwH7Lx1duRFYnVUpQsMLPKplBQ8"))
    puts "eleme==>> #{show_this['results'][0]['geometry']['location']['lat'].class}"
    # puts "eleme==>> #{show_this[:results]}"
    # show_this.each do |key, value|
    #   puts "=====>> #{key}:#{value}"
    # end
  end

  def create
    @place = Place.new(place_params)
    if @place.save
      flash[:notice] = "Successfully created #{@place.name}."
      redirect_to place_path(@place)
    else
      flash[:error] = @place.errors.full_messages.join(", ")
      redirect_to new_place_path
    end
  end

  def show
    @place = Place.find_by_id(params[:id])
    
    #accesses photourls of most recent votes
    recent_votes = @place.upvotes.last(24)
    @urls = recent_votes.collect {| vote | vote.photourl }
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def place_params
    params.require(:place).permit(:name, :lat, :lon)
  end

end
