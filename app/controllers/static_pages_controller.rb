class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to week_path(current_user.id)
    else
      redirect_to landing_path
    end
  end

  def landing
    
  end
  
end
