class NonprofitsController < ApplicationController
  
  before_action :authorize_manager, only: [:edit, :update]
  
  def show
    @nonprofit = Nonprofit.find(params[:id])
  end
  
  def edit
    @nonprofit = current_user.nonprofits.find(params[:id])
  end
  
  def update
    @nonprofit = current_user.nonprofits.find(params[:id])
    @nonprofit.assign_attributes(nonprofit_params)
    
    if @nonprofit.save
      flash[:notice] = "Nonprofit saved successfully"
      redirect_to @nonprofit
    else
      flash[:alert] = "There was an error saving the nonprofit information. Please try again."
      render :edit
    end
  end
  
  private
    def nonprofit_params
      params.require(:nonprofit).permit(:name, :website, :email, :phone, social_profile_attributes: [:id, :facebook, :twitter, :instagram, :linked_in])
    end
    
    def authorize_manager
      @nonprofit = Nonprofit.find(params[:id])
      
      if @nonprofit.managers.where(user_id: current_user.id).empty?
        flash[:alert] = "You must be a nonprofit manager to do that!"
        redirect_to nonprofit_path
      end
    end
end
