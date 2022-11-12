class RecipeFoodsController < ApplicationController
  before_action :authenticate_user!
  # load_and_authorize_resource
  def index
    @recipe_foods = RecipeFood.all
  end

  def new
    @recipe_foods = RecipeFood.new
  end

  def create
    @recipe_foods = RecipeFood.new(recipe_foods_params)

    if @recipe_foods.save
      redirect_to public_recipes_path
    else
      render 'new'
    end
  end

  def destroy
    @recipe_foods = RecipeFood.find(params[:id])
    @recipe_foods.destroy
    redirect_to recipe_foods_path
  end

  private

  def recipe_foods_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end
