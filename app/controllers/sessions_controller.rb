class SessionsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.find_by_email(params[:email])
    # If the admin exists AND the password entered is correct.
    if @admin && @admin.authenticate(params[:password])
      # Save the admin id inside the browser cookie. This is how we keep the admin
      # logged in when they navigate around our website.
      session[:member_id] = nil
      session[:admin_id] = @admin.id

      redirect_to '/admins'
    else
      # If admin's login doesn't work, send them back to the login form.
      redirect_to '/admins/login'
    end
  end

  def destroy
    session[:admin_id] = nil
    redirect_to '/admins/login'
  end
end
