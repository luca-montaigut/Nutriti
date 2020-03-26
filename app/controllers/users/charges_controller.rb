class Users::ChargesController < Users::ApplicationController
  before_action :incompleted
  before_action :already_premium

  def new
    if params[:notice] == "premium"
      @amount = 5 
      @formula = "Premium"
    else
      
    end
  end

  def index
    
  end
  
  def create
    # Amount in cents
    @amount = 500
  
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })
  
    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'eur',
    })

    current_user.update(is_premium: true)
    
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

  def incompleted
    redirect_to root_path, flash:{error: "Veuillez compléter votre profil avant de poursuivre"} if current_user.incomplete_profile?
  end

  def already_premium
    redirect_to root_path, flash:{notice: "Vous êtes déjà premium"} if current_user.is_premium
  end
end
