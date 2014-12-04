class InvoicesController < ApplicationController
  @car_id = 0
  def create
    secure_params = params.require(:invoice).permit(:c_id, :e_id, :cart_id)

    @invoice = Invoice.new(secure_params)
    if @invoice.save
      flash[:success] = "Invoice has been created"
      i = @invoice.id
      # redirect_to "/invoices/#{i}.pdf"
      redirect_to "/invoices/#{i}"
    else
      flash[:error] = "Invoice has not been created check details"
    end

    # redirect_to :controller => 'invoices', :action => 'show', :id => i
  end


  def show
    @invoice = Invoice.find(params[:id])
    @customer = Customer.find(@invoice.c_id)
    @employee = current_employee
    cart = current_cart.id
    @parts = Part.where("cart_id = ?", cart)
    # Just display the order details in the HTML in the Browser
  end

  def download_pdf
    #   Download pdf triggered by button click on show.
    @invoice = Invoice.find(params[:id])
    @customer = Customer.find(@invoice.c_id)
    @employee = current_employee
    cart = current_cart.id
    @parts = Part.where("cart_id = ?", cart)

    pdf = InvoicePdf.new(@invoice, @parts, @customer, @employee,  view_context)
    send_data pdf.render, filename:
        "invoice_#{@invoice.created_at.strftime("%d/%m/%Y")}.pdf",
              type: "application/pdf"

  end

  def new
    @invoice = Invoice.new
    # cookies[:remember_token] = @cart.id
    @customers = Customer.all
    @employee = current_employee
    @car_id = params[:car_id]
    @car = Car.find(params[:car_id])
    @parts = Part.where("car_id = ?",params[:car_id]).group(:part_name)
  end

  def update
    @part = Part.find(params[:id])
    @cart = current_cart
    @part.cart = @cart
    @part.save
    puts "cart id = #{@part.cart_id}"
    # @part.update_attribute(:cart_id, @cart.id)
    # @part.save
    redirect_to :back
  end

end
