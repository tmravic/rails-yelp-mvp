class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [ :show ]

  def index
    @restaurants = Restaurant.all
  end

  # def show
  # end

  def new
    # @review = Review.new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      # Make them try the form again if they failed
      render 'new'
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

end
