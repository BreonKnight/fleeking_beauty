module GraphHelper

#For Dryness created helper function handle downvotes and upvotes
	def countVotes(upvote, downvote)
	  respond_to do |format|
	    format.json {
	      render :json => [upvote, downvote]
	    }
	  end
	end

  def calculate_upvote_percentage( upvotes, downvotes )
    if (upvotes != 0)
      (upvotes / (downvotes + upvotes) ) * 100
    else
      0
    end
  end

end
