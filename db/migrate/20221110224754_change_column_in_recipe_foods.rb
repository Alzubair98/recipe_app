class ChangeColumnInRecipeFoods < ActiveRecord::Migration[7.0]
  def change
    change_column :recipe_foods, :quantity, "numeric USING CAST(quantity AS numeric)"
    change_column :recipe_foods, :quantity, :int
  end
end
