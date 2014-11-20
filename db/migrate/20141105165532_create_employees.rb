class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.integer :emp_id
      t.string :emp_name
      t.string :emp_email
      t.timestamps
    end
  end
end
