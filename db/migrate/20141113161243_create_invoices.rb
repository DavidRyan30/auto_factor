class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.integer :p_id
      t.integer :c_id
      t.integer :e_id
      t.timestamps
    end
  end
end
