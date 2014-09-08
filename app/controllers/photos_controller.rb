class PhotosController < ApplicationController
  def index
    user_id = request.url.split("/")[4]
    @user = User.find_by_id(user_id)
  end
  def new
    @photo = Photo.new
    user_id = request.url.split("/")[4]
    @user = User.find_by_id(user_id)
  end

  def create
    @photo = Photo.new(photo_params)
    current_user.photos << @photo
    if @photo.save
      # session[:photo_id] = @photo.id
      redirect_to root_path notice: "thank you for signing up!"
    else
      render "new"
    end
  end

  def show
  end


private
  def photo_params
    params.require(:photo).permit(:image)
  end
end
