class AddUserIdToFoods < ActiveRecord::Migration[7.0]
  def change
    add_column :foods, :user_id, :int
  end
end
