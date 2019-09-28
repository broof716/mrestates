class MarketplacesController < ApplicationController
  def index
    @marketplaces = Marketplace.all
  end

  def show
    @marketplace = Marketplace.find(params[:id])
  end
end
