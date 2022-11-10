class RecipesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @recipes = Recipe.all
  end

  def def(_new)
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
