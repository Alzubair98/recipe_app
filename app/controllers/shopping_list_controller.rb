class ShoppingListController < ApplicationController

    def shopping_list 
        @food = current_user.foods.select('foods.id, foods.name,foods.price,
            foods.measurement_unit, sum(recipe_foods.quantity) as quantity_sum').joins(:recipe_foods).group('foods.id')

        @value = 0 
        @items = 0 
        @food.each do |f| 
            @value += f.price * f.quantity_sum 
            @items += 1
        end
    end
end