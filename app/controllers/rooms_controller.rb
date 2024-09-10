class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    room = Room.new(room_params)
    if room.save
      redirect_to rooms_path
    end
  end

  def update
    @room.update(room_params)
  end

  def destroy
    if @room.destroy!
      redirect_to rooms_path
    end
  end

  private

  def set_room
    @room = Room.find(params[:id]) 
  end

  def room_params
    params.require(:room).permit(:name , :created_by , :created_for )
  end  
end
