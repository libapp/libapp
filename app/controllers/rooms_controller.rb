class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      redirect_to "/rooms"
    else
      render 'edit'
    end
  end

  def edit
    @room =Room.find(params[:number])
  end

  def update
    @room = Room.find(params[:number])
    if @room.update(room_params)
      redirect_to "/rooms"
    else
      render "edit"
    end
  end

  def show
    @room =Room.find(params[:number])
  end

  def destroy
    @room = Room.find(params[:number])
    @room.destroy!
    shedules = Schedule.where(:room_number => @room.number)

    shedules.each do |schedule|
      if schedule.status == 0 && (schedule.start_at > Time.new || (schedule.end_at > Time.new && schedule.start_at < Time.new))
        ReservationMailer.release_mail(Member.find(schedule.member_id)).deliver
      end
      schedule.destroy!
    end
    redirect_to "/rooms"
  end

  def history
    @schedules = Schedule.where(:room_number => params[:room_number])
    @schedules.reverse_order!
  end

  private

  def room_params
    params.require(:room).permit(:number, :size, :building, :status, :admin)
  end
end
