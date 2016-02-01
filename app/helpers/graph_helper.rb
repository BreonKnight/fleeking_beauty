module GraphHelper

#For Dryness created helper function handle downvotes and upvotes
	def countVotes(upvote, downvote)
	  respond_to do |format|
	    format.json {
	      render :json => [upvote, downvote]
	    }
	  end
	end

end
