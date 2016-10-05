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
