class EstatesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @estates = Estate.all
  end

  def new
    @estate = Estate.new
  end

  def create
    @estate = current_user.estates.create(estate_params)
    if @estate.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @estate = Estate.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @estate = Estate.find(params[:id])

    if @estate.user != current_user
      return render plain: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @estate = Estate.find(params[:id])
    if @estate.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end

  @estate.update_attributes(estate_params)
    if @estate.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @estate = Estate.find(params[:id])
  if @estate.user != current_user
    return render plain: 'Not Allowed', status: :forbidden
  end

    @estate.destroy
    redirect_to root_path
  end


  private

  def estate_params
    params.require(:estate).permit(:name, :description, :address)
  end

end
