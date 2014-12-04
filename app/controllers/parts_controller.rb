class PartsController < ApplicationController
  def new
    @part = Part.new
    @cars = Car.all.group(:make)
    @models = Car.where("id = ?", :car_id)
  end

  def findmodel
    @models = Car.where(make: params[:id]).group(:model)
    if @models
      @models.each {|m| puts m.model}
      respond_to do |format|
        format.json {render json: @models, status: :created}
      end
    else
      respond_to do |format|
      format.js {render :status => 403}
      end
    end
  end

  def create
    secure_params = params.require(:part).permit(:part_name, :car_id, :part_price)
    @part = Part.new(secure_params)
    @part.save
    flash[:success] = "Part #{@part.part_name} has been created"
    redirect_to '/show_parts_menu'
  end

  def delete
  end

  def show
  	@car_items = Car.all.group(:make)
    @cart = Cart.create
    make_current_cart @cart
  end

  def showparts
    # @part_items = Part.where("car_id = ?", params[:car_id]).group(:part_name)
    @part_items = Part.select('DISTINCT(#{:part_name)').where("car_id = ?", params[:car_id])


  end

end
