class AddRecipeIdToRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :recipe_foods, :recipe_id, :int
    add_column :recipe_foods, :food_id, :int
  end
end
