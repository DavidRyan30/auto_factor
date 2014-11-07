class SessionsController < ApplicationController
	def new
	end

	def create
	    employee = Employee.find_by_emp_name(params[:session][:emp_name])
        if employee && employee.authenticate(params[:session][:password])
        	sign_in employee
          	render 'parts/show'
	    else
	      flash.now[:error] = 'Invalid employee name/password combination'
	      render 'new'
	    end
	end

	def destroy
       	sign_out
    	redirect_to root_url
    end 
end
