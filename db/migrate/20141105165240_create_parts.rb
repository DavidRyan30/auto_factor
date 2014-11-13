class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :part_id
      t.string :part_name
      t.float :part_price
      t.integer :car_id
      t.timestamps
    end
    add_index :parts, :car_id
  end
end
