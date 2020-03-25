class Users::VegetariansController < ApplicationController

  def edit
	if current_user.vegetarien == false
	  current_user.update(vegetarien: true)
	else
	  current_user.update(vegetarien: false)
	end
	redirect_to :week
  end


end
