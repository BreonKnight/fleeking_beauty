class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
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

    #getting id for place to be shown
    @place = Place.find_by_id(params[:id])
    
    #accessing search helper to get photo for place
    recent_votes = @place.upvotes.last(21)
    @urls = recent_votes.collect {| vote | vote.photourl } 
  
    #gets upvotes for the place
    @upvotes = @place.upvotes.count

    #gets downvotes for the place
    @downvotes = @place.downvotes.count

    #takes the upvotes and divides it by the downvotes and creates a ratio
    @vote_percentage = calculate_upvote_percentage( @upvotes, @downvotes )

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
