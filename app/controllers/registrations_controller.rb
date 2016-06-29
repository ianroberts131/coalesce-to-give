class RegistrationsController < Devise::RegistrationsController

  def new
    super { |user| user.managers.build.build_nonprofit }
  end

  private
    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, managers_attributes: [ [nonprofit_attributes: [:name] ]])
    end
    
    def account_update_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, managers_attributes: [ :id, [nonprofit_attributes: [:id, :name]]])
    end

end