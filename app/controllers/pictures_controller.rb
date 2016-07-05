class PicturesController < ApplicationController
  def index
    @user = current_user
    @picture = Picture.new
    @pictures = @user.pictures.all
  end

  def new
    @user = current_user
    @picture = @user.pictures.new
  end

  def create
    @user = current_user
    @picture = @user.pictures.new(picture_params)
    
    if @picture.save
      flash[:notice] = "Picture uploaded successfully"
    else
      flash[:alert] = "There was an error uploading the picture. Please try again"
    end
    
    redirect_to user_pictures_path
  end
  
  private
  def picture_params
    params.require(:picture).permit(:image)
  end
end
