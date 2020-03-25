class Users::VegansController < Users::ApplicationController

  def edit
	if current_user.vegan == false
	  current_user.update(vegan: true)
	else
	  current_user.update(vegan: false)
	end
	redirect_to :week
  end


end
