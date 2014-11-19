class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :cust_name
      t.string :cust_address
      t.string :cust_phone
      t.string :cust_email
    end
  end
end
