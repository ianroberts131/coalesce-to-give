class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def home
  end
  
  def about
  end
  
  def research
  end
  
  def contact
  end
end
