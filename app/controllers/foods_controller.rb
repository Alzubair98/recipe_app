class FoodsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @foods = Food.paginate(page: params[:page], per_page: 5)
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)
    @food.user_id = current_user.id
    if @food.save
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def destroy
    set_food
    @food.destroy
    redirect_to foods_path
  end

  def edit
    set_food
  end

  def update
    set_food
    if @food.update(food_params)
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end

  def set_food
    @food = Food.find(params[:id])
  end
end
