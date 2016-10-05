class MembersController < ApplicationController
  before_action :authorize_member
  skip_before_action :authorize_member , only: [:new, :create]
  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to members_login_path
    else
      render 'new'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(member_params)
      redirect_to "/members"
    else
      render 'edit'
    end
  end

  def show
    @member = Member.find(params[:id])
  end

  def destroy
    @member = Member.find(params[:id])
    schedules = Schedule.where(:member_id => @member.id)

    schedules.each do |schedule|
      schedule.destroy!
    end

    @member.destroy!
    redirect_to '/admins/show/members'
  end

  private

  def member_params
    params.require(:member).permit(:id, :email, :name, :password, :password_confirmation)
  end


end
