class Operator::MarketplacesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_marketplace, only: [:show]

  def new
    @marketplace = Marketplace.new
  end

  def create
    @marketplace = current_user.marketplaces.create(marketplace_params)
    if @marketplace.valid?
      redirect_to operator_marketplace_path(@marketplace)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  private

  def require_authorized_for_current_marketplace
    if current_marketplace.user != current_user
      render plain: "Unauthorized", status: :unauthorized
    end
  end

  helper_method :current_marketplace
  def current_marketplace
    @current_marketplace ||= Marketplace.find(params[:id])
  end

  def marketplace_params
    params.require(:marketplace).permit(:title, :description, :cost, :image)
  end
end
