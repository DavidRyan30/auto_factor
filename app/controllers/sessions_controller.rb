class SessionsController < ApplicationController
	def new
	end

	def create
	    employee = Employee.find_by_emp_email(params[:session][:emp_email])
        if employee && employee.authenticate(params[:session][:password])
        	sign_in employee
        	flash[:success] = "Welcome to Auto Stock!"
          	render 'static_pages/welcome'
	    else
	      flash.now[:error] = 'Invalid employee email/password combination'
	      render 'new'
	    end
	end

	def destroy
       	sign_out
       	flash[:success] = "Thank you for using Auto Stock!"
    	  redirect_to root_url
    end 
end
