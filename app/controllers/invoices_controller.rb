class InvoicesController < ApplicationController
  def create
  	secure_params = params.require(:invoice).permit(:part_id, :cust_id, :employee_price)
    @invoice = Invoice.new(secure_params)
    @invoice.save
    
  end

  def show
  end

  def new
  	@invoice = Invoice.new
  	@customers = Customer.all
  end
end
