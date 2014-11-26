class InvoicesController < ApplicationController
  def create
  	secure_params = params.require(:invoice).permit(:c_id, :e_id, :p_id)
    @invoice = Invoice.new(secure_params)
    @invoice.save
    i = @invoice.id
    
    redirect_to "/invoices/#{i}.pdf"

    # redirect_to :controller => 'invoices', :action => 'show', :id => i
  end

  def show
    @invoice = Invoice.find(params[:id])
    @part = Part.find(@invoice.p_id)
    @customer = Customer.find(@invoice.c_id)
    @car = Car.find(@part.car_id)
    @employee = current_employee
    respond_to do |format|
      # format.html
      format.pdf do
        pdf = InvoicePdf.new(@invoice, @part, @car, @customer, @employee,  view_context)
        send_data pdf.render, filename: 
        "invoice_#{@invoice.created_at.strftime("%d/%m/%Y")}.pdf",
        type: "application/pdf"
      end
    end
    @part.destroy
  end

  def new
  	@invoice = Invoice.new
  	@customers = Customer.all
    @employee = current_employee
    @part = Part.find(params[:part_id])
  end
end
