class PhotosController < ApplicationController
  def index
    user_id = request.url.split("/")[4]
    @user = User.find_by_id(user_id)
  end
  def new
    @photo = Photo.new
    user_id = request.url.split("/")[4]
    @user = User.find_by_id(user_id)
    @tag = Tag.new
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

  def update
    @user = User.find(params[:user_id])

    @tag = Tag.create(:user_id => @user.id, :photo_id => @photo.id)
    if @tag.valid?
      flash[:notice] = "Tags were saved"
      redirect_to root_path
    else
      redirect_to user_path
    end
  end


private
  def photo_params
    params.require(:photo).permit(:image)
  end
end
