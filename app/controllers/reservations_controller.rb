class ReservationsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
    @schedules = Schedule.where(:member_id => current_member.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def history
      @schedules = Schedule.where(:member_id => current_member.id)
  end
end
