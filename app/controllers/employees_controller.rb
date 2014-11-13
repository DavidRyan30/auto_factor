class EmployeesController < ApplicationController
  def new
  	 @employee = Employee.new
  end

   def create
        secure_params = params.require(:employee).permit(:emp_name, :emp_address, 
                                  :password, :password_confirmation)
        @employee = Employee.new(secure_params)
        if @employee.save
          sign_in @employee
        	flash[:success] = "Welcome to the Auto Factor App!"
          render 'static_pages/welcome'
        else
            render 'new'     
        end
      end
end
