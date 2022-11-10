class PublicRecipesController < ApplicationController
    def index
        @public_recipes = Recipe.all
    #   @public_recipes = Recipe.includes(:user).includes(:recipe_foods)
    #     .includes(:foods).where(public: true).order(created_at: :desc)
    end
end