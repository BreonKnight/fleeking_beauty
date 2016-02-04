class UsersController < ApplicationController
  
  before_action :logged_in?, only: [:index, :edit, :show]

  def index
    @users = User.last(24)
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params) # calls user_params method
    if @user.save
      flash[:notice] = "Successfully created user"
      login(@user)
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find_by_userName(params[:id])
    @place = Place.find_by_id(params[:id])

    @places = Place.last(10)
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
      # If we decide to let users update email address, email will be downcased before submission & update
      user_edit_params[:email].downcase!
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
