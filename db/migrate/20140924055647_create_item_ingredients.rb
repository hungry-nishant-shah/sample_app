class CreateItemIngredients < ActiveRecord::Migration
  def change
    create_table :item_ingredients do |t|
      t.integer :ingredient_id
      t.integer :item_id

      t.timestamps
    end
    add_index :item_ingredients , [:ingredient_id,:item_id]
  end
end
