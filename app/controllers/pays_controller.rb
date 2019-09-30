class PaysController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.pays.create(marketplace: current_marketplace)

    # Amount in cents
    @amount = 500

    customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd'
    )

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
