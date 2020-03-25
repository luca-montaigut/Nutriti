class Users::ExpressRecipesController < ApplicationController

  def edit
	if current_user.express == false
	  current_user.update(express: true)
	else
	  current_user.update(express: false)
	end
	redirect_to :week
  end

end
