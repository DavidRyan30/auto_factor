class ChangeIds < ActiveRecord::Migration
  def change
  	remove_column :cars, :model_id
  	remove_column :customers, :customer_id
  	remove_column :parts, :part_id
  	remove_column :employees, :emp_id
  end
end
