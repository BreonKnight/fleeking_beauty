class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def create
    place = Place.find_by(name: params[:name])
    if(place)
      redirect_to add_place_path, :flash => {:notice => "This place already exists"}
    end
    #grab params name and geocode it
    this_place = name_cleaner(params[:name])
    new_place = get_coordinates(params[:name], this_place)
    places = Place.all
    coordinates = places.collect { | place | place.lat+","+place.lon}
    search_request = request_assembly(new_place, coordinates)
    miles = get_distances(search_request)
    limit = 50
    result = mileage_checker(limit, miles)
    p "REAL NAME IS #{params[:name]}"
    if(result)
      @place = Place.create({name: params[:name], lat: new_place[:lat], lon: new_place[:lon]})
      redirect_to add_place_path, :flash => {:notice => "Created new place"}
    else
      redirect_to add_place_path, :flash => {:error => "Unable to add new place"}
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
