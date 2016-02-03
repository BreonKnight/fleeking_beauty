class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    p "===> #{params[:name]}"
    place = Place.find_by(name: params[:name])
    p "===> Expecting to find matching place #{place}"
    p "===> Expecting to return nil for a non-matching place #{place}"
    if(place)
      p "This place already exists"
    end
    #grab params name and geocode it
    new_place = get_coordinates(params[:name])
    p "Expecting a new geocoded place object #{new_place}"
    places = Place.all
    coordinates = places.collect { | place | place.lat+","+place.lon}
    p "Expecting a collection of lat/long #{coordinates}"

    
   
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
