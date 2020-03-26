class Users::ChargesController < Users::ApplicationController
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
end
