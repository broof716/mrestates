class Operator::EstatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @estate = Estate.new
  end

  def create
    @estate = current_user.estates.create(estate_params)
    redirect_to root_path

  end

  def show
    @estate = Estate.find(params[:id])
  end

  def edit
  end

  private

  def estate_params
    params.require(:estate).permit(:name, :description, :address)
  end



end
