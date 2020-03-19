class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      @week = Week.find_by(user_id: current_user.id)
      redirect_to week_path(@week.id)
    else
      redirect_to landing_path
    end
  end

  def landing
    
  end
  
end
