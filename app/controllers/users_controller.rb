class UsersController < ApplicationController

  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params) # calls user_params method
    login(@user)
    redirect_to @user
  end

  def show
    @user = User.find_by_userName(params[:id])
    @place = Place.find_by_id(params[:id])

    @places = Place.all 
    @upvote = Upvote.find_by_id(params[:id])
    @upvotes = @user.upvotes.where({place: @place})
    @downvotes = @user.downvotes.where({place: @place}).count

  end

  def edit
    user_id = params[:id]
    @user = User.find_by_userName(user_id)
    render :edit
  end

  def update
    user_id = params[:id]
    user = User.find_by_userName(user_id)
    user_edit_params = params.require(:user).permit(:first_name, :last_name, :avatar)
    user.update_attributes(user_edit_params)
    redirect_to user_path(user)
  end

  def destroy
    user_id = params[:id]
    user = User.find_by_userName(user_id)
    user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :userName, :email, :avatar, :password)
  end

end
