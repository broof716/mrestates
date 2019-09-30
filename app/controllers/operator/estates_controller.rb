class Operator::EstatesController < ApplicationController

  def new
    @estate = Estate.new
  end

  def create
    @estate = current_user.estates.create(estate_params)
    if @estate.valid?
      redirect_to operator_estate_path(@estate)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @estate = Estate.find(params[:id])
  end

  private

  def estate_params
    params.require(:estate).permit(:name, :description, :address)
  end



end
