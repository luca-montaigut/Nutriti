class Users::VegetariansController < Users::ApplicationController

  def edit
	if current_user.vegetarian == false
	  current_user.update(vegetarian: true)
	else
	  current_user.update(vegetarian: false)
	end
	redirect_to :week
  end


end
