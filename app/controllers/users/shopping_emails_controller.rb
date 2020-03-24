class Users::ShoppingEmailsController < Users::ApplicationController

  def show
	@user = current_user
	UserMailer.shopping_cart_email(@user).deliver_now
	redirect_to :week
  end

end
