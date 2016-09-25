class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @schedule["member_id"] = params[:member_id]
    @schedule["room_number"] = params[:room_number]
    @schedule["start_at"] = Time.parse(params[:start_at])
    @schedule["end_at"] = Time.parse(params[:end_at])
  end

  def create
    @schedule = Schedule.new(schedule_params)

    if @schedule.save
      redirect_to "/schedules"
    else
      render 'edit'
    end
  end

  def index
    @table_schedules = Hash.new {|h,k| h[k] = Array.new}

    Schedule.all.each do |schedule|
      @table_schedules[schedule.room_number][schedule.start_at.hour - 8] = 1
      @table_schedules[schedule.room_number][schedule.end_at.hour - 1 - 8] = 1
    end

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


  private

  def schedule_params
    params.require(:schedule).permit(:member_id, :room_number, :start_at, :end_at)
  end
end
