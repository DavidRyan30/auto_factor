class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|

      t.string :part_name
      t.float :part_price
      t.integer :car_id
      t.integer :cart_id
      t.timestamps
    end
    add_index :parts, :car_id
    add_index :parts, :cart_id
  end
end
