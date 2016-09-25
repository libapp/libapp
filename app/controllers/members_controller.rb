class MembersController < ApplicationController
  before_action :authorize_member
  skip_before_action :authorize_member , only: [:new, :create,:show]
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
    @member.update_attribute :status, 1
    redirect_to @member
  end

  private

  def member_params
    params.require(:member).permit(:id, :email, :name, :password, :password_confirmation)
  end


end
