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
    @room.update_attribute :status, 1
    redirect_to "/rooms"
  end

  private

  def room_params
    params.require(:room).permit(:number, :size, :building, :status, :admin)
  end
end
