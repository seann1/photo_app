class TagsController < ApplicationController
  def index
    user_id = request.url.split("/")[4]
    @user = User.find_by_id(user_id)
  end
  def new
    @tag = Tag.new
    # user_id = request.url.split("/")[4]
    @user = User.find_by_id(current_user)
  end

  def create
    @user = User.find(params[:tag][:user_id])
    @photo = Photo.find(params[:photo_id])
    @tag = Tag.create(tag_params)
    if @tag.valid?
      flash[:notice] = "Tags were saved"
      redirect_to root_path
    else
      redirect_to user_path
    end
  end

  def show
  end


private
  def tag_params
    params.require(:tag).permit(:user_id, :photo_id)
  end
end
