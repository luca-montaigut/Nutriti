class Users::ApplicationController < ApplicationController
  before_action :authenticate_user!
  
  layout 'users'

  def user_incompleted
    if current_user.incomplete_profile?
      redirect_to edit_user_path(current_user.id)
    end
  end

  def only_premium
    if !user_signed_in? || !current_user.is_premium
      redirect_to root_path, flash: {error: "Cette action est réservée aux membres Premium !"}
    end
  end
end