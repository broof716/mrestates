class PaysController < ApplicationController
  before_action :authenticate_user!

  def create
    if current_marketplace.premium?

    # Amount in cents
    @amount = (current_marketplace.cost * 100).to_i

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'MR Estate Sale',
      currency: 'usd'
    )
  end
  
  current_user.pays.create(marketplace: current_marketplace)
  redirect_to marketplace_path(current_marketplace)
  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to root_path
  end

  private 

  def current_marketplace
    @current_marketplace ||= Marketplace.find(params[:marketplace_id])
  end
end
