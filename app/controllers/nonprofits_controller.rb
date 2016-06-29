class NonprofitsController < ApplicationController
  def show
    @nonprofit = Nonprofit.find(params[:id])
  end
end
