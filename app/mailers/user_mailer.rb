class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue chez Nutriti !')
  end

  def shopping_cart_email(user)
	@user = user
	@alim_groups = Food.all.map(&:alim_group).uniq
	mail(to: @user.email, subject: 'Liste de course Nutriti')
  end

end
