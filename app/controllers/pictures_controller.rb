class PicturesController < ApplicationController
  
  def index
    if params[:user_id].present?
      if current_user.id == params[:user_id]
        @user = current_user
      else
        @user = User.find(params[:user_id])
      end
      @pictures = @user.pictures.all
    else
      @nonprofit = Nonprofit.find(params[:nonprofit_id])
      @pictures = @nonprofit.pictures.all
    end
    
    @picture = Picture.new
  end

  def show
    if params[:user_id].present?
      if current_user.id == params[:user_id]
        @user = current_user
      else
        @user = User.find(params[:user_id])
      end
      @picture = @user.pictures.find(params[:id])
    else
      @nonprofit = Nonprofit.find(params[:nonprofit_id])
      @picture = @nonprofit.pictures.find(params[:id])
    end
  end

  def new
    @user = current_user
    
    if params[:user_id].present?
      @picture = @user.pictures.new
    else
      @nonprofit = @user.nonprofits.find(params[:nonprofit_id])
      @picture = @nonprofit.pictures.new
    end
  end

  def create
    @user = current_user
    
    if params[:user_id].present?
      @picture = @user.pictures.new(picture_params)
    else
      @nonprofit = @user.nonprofits.find(params[:nonprofit_id])
      @picture = @nonprofit.pictures.new(picture_params)
    end
    
    if @picture.save
      flash[:notice] = "Picture uploaded successfully"
    else
      flash[:alert] = "There was an error uploading the picture. Please try again"
    end
    
    if params[:user_id].present?
      redirect_to user_pictures_path
    else
      redirect_to nonprofit_pictures_path
    end
  end
  
  def destroy
    @user = current_user
    
    if params[:user_id].present?
      @picture = @user.pictures.find(params[:id])
    else
      @nonprofit = @user.nonprofits.find(params[:nonprofit_id])
      @picture = @nonprofit.pictures.find(params[:id])
    end
    
    if @picture.destroy
      flash[:notice] = "Picture deleted successfully"
    else
      flash[:alert] = "The was an error deleting the picture"
    end
    
    if params[:user_id].present?
      redirect_to user_pictures_path
    else
      redirect_to nonprofit_pictures_path
    end
  end
  
  private
  def picture_params
    params.require(:picture).permit(:image)
  end
end
