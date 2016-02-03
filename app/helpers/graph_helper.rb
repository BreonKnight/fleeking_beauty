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
    if (upvotes == 0)
      0
    else
      # percentage = ((upvotes / (downvotes + upvotes) ) * 100)
      totalvotes = downvotes.to_f + upvotes.to_f
      ratio = upvotes.to_f / totalvotes
      percentage = ratio * 100
      percentage.to_i
    end
  end

end
