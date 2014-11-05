class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.integer :customer_id
      t.string :cust_name
      t.string :cust_address
      t.string :cust_phone

      t.timestamps
    end
  end
end
