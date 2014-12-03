class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :c_id
      t.integer :e_id
      t.integer :cart_id
      t.timestamps
    end
  end
end
