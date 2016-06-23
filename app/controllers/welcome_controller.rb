class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :about, :research, :contact]
  def home
  end
  
  def about
  end
  
  def research
  end
  
  def contact
  end
end
