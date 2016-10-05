class AdminsController < ApplicationController
  before_action :authorize_admin

  def index
    @admins = Admin.all
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)

    if @admin.save
      redirect_to "/admins/show/admins"
    else
      render 'new'
    end
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update(admin_params)
      redirect_to "/admins"
    else
      render "edit"
    end
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def destroy
    @admin = Admin.find(params[:id])
    @admin.update_attribute :status, 1
    redirect_to "/admins/show/admins"
  end


#manage admin
  def show_admins
    @admins = Admin.where.not(id: 1)
  end

#manage members
  def show_members
    @members = Member.all
  end

  def members_profile
    @member = Member.find(params[:member_id])
  end

  def members_history
    @schedules = Schedule.where(:member_id => params[:member_id])
    @schedules.reverse_order!
  end

  def new_member
    @member = Member.new
  end

  def create_member
    @member = Member.new(params.permit(:email, :name, :password))
    if @member.save
      redirect_to "/admins"
    else
      render 'new_member'
    end
  end

  private

  def admin_params
    params.require(:admin).permit(:id, :email, :name, :password, :level, :status)
  end

end
