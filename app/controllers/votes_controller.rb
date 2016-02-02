class VotesController < ApplicationController
  def new
    first = Place.first
    last = Place.last
    #need to include something to test if the place id actually exists
    rand_place = rand(first.id..last.id)
    @place = Place.find_by_id(rand_place)
    @photo_array = searchFlickr(@place)
    @n = rand(0..@photo_array.length)
    respond_to do | format |
      format.html
      format.json do 
        render json: {url: @photo_array[@n], place: @place.id}
      end 
    end
  end

  def create
    if(params[:upvote]) 
      Upvote.create(user_id: current_user.id, place_id: params[:place], photourl: params[:photourl])
      p "you created a new upvote"
      redirect_to vote_path
    elsif(params[:downvote])
      Downvote.create(user_id: current_user.id, place_id: params[:place], photourl: params[:photourl])
      p "you created a new downvote"
      redirect_to vote_path
    else
      redirect_to vote_path
    end

  end

end

