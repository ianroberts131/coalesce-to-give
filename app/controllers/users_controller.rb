class UsersController < ApplicationController
  def show
    if current_user
      @user = current_user
    else
      @user = User.find(params[:id])
    end
  end
end
