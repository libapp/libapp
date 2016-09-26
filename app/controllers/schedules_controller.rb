class SchedulesController < ApplicationController
  def new
    @schedule = Schedule.new
    @schedule["member_id"] = params[:member_id]
    @schedule["room_number"] = params[:room_number]
    @schedule["start_at"] = params[:start_at]
    @schedule["end_at"] = params[:end_at]
  end

  def create
    @schedule = Schedule.new(schedule_params)

    flag = false
    schedules = Schedule.where(:member_id => @schedule.member_id, :status => 0)
    schedules.each do |schedule|
      if schedule.start_at > Time.new
        flag = true
      end
    end

    if flag
      flash[:error] = "You can only book one room at a time"
      redirect_to '/schedules'
    else
      if @schedule.save!
        redirect_to '/schedules/history'
      else
        flash[:error] = "Fail"
        redirect_to '/schedules'
      end
    end
  end

  def index
    if params[:date] == nil
      @date = Time.now
    else
      @date = Time.parse(params[:date])
    end

    if @date > (Time.now + 14.days) || @date < Time.now.beginning_of_day
      flash[:error] = "You can only book rooms from now to 2 weeks later"
      redirect_to "/schedules"
    end

    if params[:room_number] != nil && params[:room_number] != ''
      rooms = Room.where(:number => params[:room_number])
    elsif params[:commit] != "Search" || (params[:size] == "all" && params[:building] == 'all')
      rooms = Room.all
    elsif params[:building] == 'all'
      rooms = Room.where(:size => params[:size])
    elsif params[:size] == "all"
      rooms = Room.where(:building => params[:building])
    else
      rooms = Room.where(:building => params[:building], :size => params[:size])
    end

    @table_schedules = Hash.new {|h,k| h[k] = Array.new}

    rooms.each do |room|
      14.times do |i|
        if @date <= Time.new.end_of_day && i+8 < Time.new.hour
          @table_schedules[room.number][i] = 1
        else
          @table_schedules[room.number][i] = 0
        end
      end
    end

    rooms.each do |room|
      schedules = Schedule.where(:room_number => room.number, :status => 0)

      if params[:commit] != "Search"
        schedules.each do |schedule|
            if schedule.start_at > Time.new.beginning_of_day && schedule.start_at < Time.new.end_of_day
              @table_schedules[schedule.room_number][schedule.start_at.hour - 8] = 1
              @table_schedules[schedule.room_number][schedule.end_at.hour - 1 - 8] = 1
            end
        end
      else
        schedules.each do |schedule|
          if schedule.start_at > @date && schedule.start_at < @date.end_of_day
            @table_schedules[schedule.room_number][schedule.start_at.hour - 8] = 1
            @table_schedules[schedule.room_number][schedule.end_at.hour - 1 - 8] = 1
          end
        end
      end
    end
    @table_schedules.sort.to_h
  end

  def show
    @schedules = Schedule.where(:member_id => current_member.id)
  end

  def edit
  end

  def update
  end

  def destroy
    schedule = Schedule.find(params[:id])
    if schedule.end_at > Time.new && schedule.start_at < Time.new
      schedule.update_attribute :end_at, Time.new
    end

    schedule.update_attribute :status, 1
    redirect_to "/schedules/history"
  end

  def history
    @schedules = Schedule.where(:member_id => current_member.id)
    @schedules.reverse_order!
  end


  private

  def schedule_params
    params.require(:schedule).permit(:id, :member_id, :room_number, :start_at, :end_at)
  end
end
