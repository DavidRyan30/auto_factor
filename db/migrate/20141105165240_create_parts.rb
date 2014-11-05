class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.integer :part_id
      t.string :part_name
      t.float :part_price

      t.timestamps
    end
  end
end
