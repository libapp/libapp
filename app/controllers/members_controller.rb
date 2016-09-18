class MembersController < ApplicationController
  before_action :set_info, only: [:show_profile, :show_profile]

  def sign_up_page

  end

  def sign_up
    member = Member.new(name: params[:name], email: params[:email],
                                password: params[:password], password_confirmation: params[:password_confirmation])
    respond_to do |format|
      if member.save
        format.html {redirect_to members_url, notice: 'Member was successfully signed up.'}
      else
        format.html {render action: 'sign_up_page', notice: 'Something went wrong, try again.'}
      end
    end
  end

  def login_page
    #get the login page show up
  end

  def login
    @member = Member.find_by(name: params[:name])
    if @member and @member.authenticate(params[:password])
      session[:user_id] = @member.id
      session[:user_name] = @member.name
      redirect_to members_path, notice: 'Member logged as : '
    else
      redirect_to members_login_url, alert: 'Invalid user/password combination'
    end
  end

  def show_profile
  end

  def edit_profile
    respond_to do |format|
      if @member.update(name: params[:name], email: params[:email],
                        password: params[:password], password_confirmation: params[:password_confirmation])
        format.html {redirect_to members_path, notice: 'Member was successfully signed up.'}
      else
        format.html {render action: 'sign_up_page', notice: 'Something went wrong, try again.'}
      end
    end
  end

  def show_reservation_history

  end

  def search_room

  end

  def show_room_detail

  end

  def release_room

  end

  def book_room

  end


  private
  def set_info
    @member=Member.find(session[:user_id])
    @schedules = Schedule.order(:start_at)#.order(:member_id: session[:user_id])
    #@rooms = Romms

  end


end
