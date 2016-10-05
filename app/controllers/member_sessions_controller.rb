class MemberSessionsController < ApplicationController
  def new
    @member = Member.new
  end

  def create
    @member = Member.find_by_email(params[:email])
    # If the member exists AND the password entered is correct.
    if @member && @member.status == '' && @member.authenticate(params[:password])
      # Save the member id inside the browser cookie. This is how we keep the admin
      # logged in when they navigate around our website.
      session[:admin_id] = nil
      session[:member_id] = @member.id

      redirect_to '/members'
    else
      # If member's login doesn't work, send them back to the login form.
      redirect_to '/members/login'
    end
  end

  def destroy
    session[:member_id] = nil
    redirect_to '/members/login'
  end
end
