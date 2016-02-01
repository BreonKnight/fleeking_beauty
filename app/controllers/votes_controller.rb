class VotesController < ApplicationController
  def new
    @n = 1
    first = Place.first
    last = Place.last
    #need to include something to test if the place id actually exists
    rand_place = rand(first.id..last.id)
    @place = Place.find_by_id(rand_place)
    @photo_array = searchFlickr(@place)

  end

  def create
    if(params[:upvote]) 
      Upvote.create(user_id: current_user.id, place_id: params[:place])
      p "you created a new upvote"
    elsif(params[:downvote])
      Downvote.create(user_id: current_user.id, place_id: params[:place])
      p "you created a new downvote"
    end
    # if this is a upvote
    #   create an upvote
    # if this is an downvote
    #   create a downvote
  end
end

