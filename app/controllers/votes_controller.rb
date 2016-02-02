class VotesController < ApplicationController
  def new
    first = Place.first
    last = Place.last
    #grabs a random place
    rand_place = rand(first.id..last.id)
    @place = Place.find_by_id(rand_place)
    @photo_array = searchFlickr(@place)
    #grabs a random photo from photos array
    @n = rand(0..@photo_array.length)
    photourl = @photo_array[@n]
    search_count = 0
    #checks to see if user has already seen photo, if so get another one, if it searches more than 19 times it gives up
    while(original_photo(photourl) != true)
      @n = rand(0..@photo_array.length)
      photourl = @photo_array[@n]
      search_count = search_count + 1
      if(search_count > 19)
        p "MAXED OUT"
        break
        # redirect_to vote_path
      end
    end
    #will respond to ajax with json
    respond_to do | format |
      format.html
      format.json do 
        render json: {url: photourl, place: @place.id}
      end 
    end
  end

  def create
    if(params[:upvote]) 
      p "user id class: #{current_user.id.class}  place id class: #{params[:place_id].class}  photourl class: #{params[:photourl].class}"
      Upvote.create(user_id: current_user.id, place_id: params[:place_id], photourl: params[:photourl])
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

private

def inspect_vote_params
  if(params[:photourl].class == "String")
      if(/staticflickr/ =~ params[:photourl])
        if(params[:place_id] == "String")
          return true
        end
      end
  end
end

#helper function that will return true if a photo is original to the user
def original_photo(photourl)
   if(current_user.upvotes.find_by(photourl: photourl) || current_user.downvotes.find_by(photourl: photourl)) 
      return false
    end
    return true
end

end

