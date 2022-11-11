class ShoppingListController < ApplicationController
  def shopping_list
    @recipes = RecipeFood.all
    @user = current_user
  end
end
