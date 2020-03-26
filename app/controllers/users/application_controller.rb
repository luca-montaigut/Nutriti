class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!
  
  layout 'users'


  def only_premium
    if !user_signed_in? || !current_user.is_premium
      redirect_to root_path, flash: {error: "Cette action est réservée aux membres Premium !"}
    end
  end
end