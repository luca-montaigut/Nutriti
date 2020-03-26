class Users::ShoppingEmailsController < Users::ApplicationController
	before_action :only_premium, only: [:show, :update, :destroy]

  def show
	@user = current_user
	UserMailer.shopping_cart_email(@user).deliver_now
	redirect_to :week
  end

end
