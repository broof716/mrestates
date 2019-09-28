class Operator::MarketplacesController < ApplicationController
  before_action :authenticate_user!

  def new
    @marketplace = Marketplace.new
  end

  def create
    @marketplace = current_user.marketplaces.create(marketplace_params)
    redirect_to operator_marketplace_path(@marketplace)
  end

  def show
    @marketplace = Marketplace.find(params[:id])
  end

  private

  def marketplace_params
    params.require(:marketplace).permit(:title, :description, :cost)
  end
end
