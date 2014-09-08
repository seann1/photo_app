class SessionsController < ApplicationController
  before_filter :logged_in?, only: [:new]

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "logged in!"
    else
      flash.now.alert = "email or password is invalid"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_user_path, notice: "logged out"
  end
end
