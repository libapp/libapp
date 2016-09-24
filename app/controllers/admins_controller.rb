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
      redirect_to @admin
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
      redirect_to @admin
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
    redirect_to @admin
  end


#manage admin
  def show_admins
    @admins = Admin.where.not(id: 1)
  end

#manage members
  def show_members
    @members = Member.all
  end

  def show_member_profile
  end

  def delete_member
  end

  private

  def admin_params
    params.require(:admin).permit(:id, :email, :name, :password, :level, :status)
  end

end
