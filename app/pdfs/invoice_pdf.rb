class InvoicePdf < Prawn::Document
 def initialize(invoice, parts, customer, employee, view)
    super()
    @invoice = invoice
    @parts = parts
    @customer = customer
    @employee = employee
    @view = view
    logo
    logo_divider
    invoice_dets
    cust_dets
    delivery_dets
    part_dets
    thanks_message
  end
  def logo_divider
  	  	# stroke_axis
	stroke_color "ff0000"
	stroke do
 		move_down 50
 		horizontal_rule
	end

  end

  def logo
  	move_down 10
  	move_down 10
  	text "AUTO STOCK",
  	:indent_paragraphs => 120, :size =>40, :color => "0000ff"
  end

  def thanks_message
    move_down 5
    move_down 15
    text "Thank you for shopping with Auto Shop.",
    :indent_paragraphs => 20, :size => 13
  end

  def invoice_dets
  	move_down 20
  	text "Invoice Number: #{@invoice.id}      Date: #{@invoice.created_at.strftime("%d/%m/%Y")}   Served By: #{@employee.emp_name}",
  	:indent_paragraphs => 20, :size => 13
  end

  def cust_dets
  	move_down 40
  	text "Name: #{@customer.cust_name}    Email: #{@customer.cust_email} Phone: #{@customer.cust_phone}",
  	:indent_paragraphs => 20, :size => 13
  end

  def delivery_dets
  	move_down 10
  	text "Delivery Address: #{@customer.cust_address}",
  	:indent_paragraphs => 20, :size => 13
  end

  def part_dets
    @total_price = 0
  	move_down 90
    @parts.each do |part|
	  text "Part: #{part.part_name.slice(0,1).capitalize + part.part_name.slice(1..-1)}
		Price: €#{part.part_price}
    ",
  	:indent_paragraphs => 20, :size => 13
    @total_price = @total_price + part.part_price

    end
    text "Total Price ex vat: #{@total_price.to_s}"
  end

  def precision(num)
    @view.number_with_precision(num, :precision => 2)
  end
end