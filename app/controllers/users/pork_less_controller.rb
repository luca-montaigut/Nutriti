class Users::PorkLessController < ApplicationController

  def edit
	if current_user.sans_porc == false
	  current_user.update(sans_porc: true)
	else
	  current_user.update(sans_porc: false)
	end
	redirect_to :week
  end


end
