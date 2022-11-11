class ChangeColumnRecipesTable < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :public, "boolean USING CAST(public AS boolean)"
    change_column :recipes, :public, :boolean
  end
end
