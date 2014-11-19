class InvoicesController < ApplicationController
  def create
  end

  def show
  end

  def new
  	@invoice = Invoice.new
  	@customers = Customer.all
  	
  end
end
