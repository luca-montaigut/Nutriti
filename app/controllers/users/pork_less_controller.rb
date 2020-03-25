class Users::PorkLessController < Users::ApplicationController

  def edit
	if current_user.porkless == false
	  current_user.update(porkless: true)
	else
	  current_user.update(porkless: false)
	end
	redirect_to :week
  end


end
