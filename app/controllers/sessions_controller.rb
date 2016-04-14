class SessionsController < ApplicationController

	def new 
		@user = User.new
		render :new
	end


	def create
	  user_params = params.require(:user).permit(:email, :password)
	  	# Sets user's email address to lower case before logging user in
	  	user_params[:email].downcase!
	  @user = User.confirm(user_params)
	  if @user
	    login(@user)
	    flash[:notice] = "Successfully logged in."      # <--- Add this flash notice
	    redirect_to voting_path
	  else
	    flash[:error] = "Incorrect email or password."  # <--- Add this flash error
	    redirect_to login_path
	  end
	end

	def destroy
	  session[:user_id] = nil
	  flash[:notice] = "Successfully logged out."        # <--- Add this flash notice
	  redirect_to root_path
	end


end
