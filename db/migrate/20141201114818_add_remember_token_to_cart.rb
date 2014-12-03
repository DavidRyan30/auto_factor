class AddRememberTokenToCart < ActiveRecord::Migration
  def change
  	add_column :carts, :cart_token, :string
    add_index  :carts, :cart_token
  end
end
