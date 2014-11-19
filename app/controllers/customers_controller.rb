class CustomersController < ApplicationController
  def show
  end

  def new
  	@customer = Customer.new
  end

  def create
  	secure_params = params.require(:customer).permit(:cust_name, :cust_address, :cust_email, :cust_phone)
  	@customer = Customer.new(secure_params)
  	@customer.save
    redirect_to root_path
  end
end
