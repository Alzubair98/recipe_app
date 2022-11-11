class ChangeColumnInFoodsTable < ActiveRecord::Migration[7.0]
  class ChangeColumnInFoodsTable < ActiveRecord::Migration[7.0]
    def change
      # change_column :foods, :price, "numeric USING CAST(price AS numeric)"
      change_column :foods, :price, :float
    end
  end
end
