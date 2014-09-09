class UsersController < ApplicationController

  def index
    if current_user

    else
      redirect_to signup_path
    end
  end
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path notice: "thank you for signing up!"
    else
      render "new"
    end
  end

  def show
    @photos = current_user.photos
    @user = User.find(current_user)
    @users = User.all
    @tag = Tag.new
  end

  def update

  end


private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
