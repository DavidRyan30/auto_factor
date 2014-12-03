class InvoicesController < ApplicationController
  @car_id = 0
  def create
    # @part_ids = params[:invoice][:parts] = []
  	secure_params = params.require(:invoice).permit(:c_id, :e_id, :cart_id)
    @invoice = Invoice.new(secure_params)

    if @invoice.save
      flash[:success] = "Invoice has been created"
      i = @invoice.id
      redirect_to "/invoices/#{i}.pdf"
    else
      flash[:error] = "Invoice has not been created for parts #{:parts.to_s}"
      i = @invoice.id
      redirect_to "/invoices/#{i}"
    end
    

    # redirect_to :controller => 'invoices', :action => 'show', :id => i
  end

  def show
    @invoice = Invoice.find(params[:id])
    @customer = Customer.find(@invoice.c_id)
    @employee = current_employee
    cart = current_cart.id
    @parts = Part.where("cart_id = ?", cart)
    # @parts = Part.find_by_cart_id(cart)
    # puts @parts.part_name
    respond_to do |format|
      format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice, @parts, @customer, @employee,  view_context)
        send_data pdf.render, filename: 
        "invoice_#{@invoice.created_at.strftime("%d/%m/%Y")}.pdf",
        type: "application/pdf"
      end
    end
    cookies.delete(:cart_token)
    current_cart.delete
  end

  def new
  	@invoice = Invoice.new
    # cookies[:remember_token] = @cart.id
  	@customers = Customer.all
    @employee = current_employee
    @car_id = params[:car_id]
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
