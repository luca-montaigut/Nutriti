class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @users_week = Week.find_by(user_id: current_user.id)
      redirect_to week_path(@users_week.id)
    else
      redirect_to landing_path
    end
  end

  def landing
    
  end
  
end
