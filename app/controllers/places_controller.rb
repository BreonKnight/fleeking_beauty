class PlacesController < ApplicationController
  include SearchHelper

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
    @place = Place.find_by_id(params[:id])
    @urls = searchFlickr(@place)
    @upvotes = @place.upvotes.count
    @downvotes = @place.downvotes.count

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
