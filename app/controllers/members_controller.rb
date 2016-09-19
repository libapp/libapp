class MembersController < ApplicationController

  def index
    @members = Member.all
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new(member_params)
    if @member.save
      redirect_to @member
    else
      render 'edit'
    end
  end

  def edit
    @member = Member.find(params[:id])
  end

  def update
    @member = Member.find(params[:id])
    if @member.update(room_params)
      redirect_to @member
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


end
