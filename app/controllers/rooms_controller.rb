class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = Room.all
  end

  def show
    @rooms = Room.all
   
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    room = Room.new(room_params)
    if room.save
    else 
    end
  end

  def update
    if @room.update(room_params)
    else 
    end
  end

  def destroy
    if @room.destroy!
    end
  end

  private
    def set_room
      if Room.any?
        @room = Room.find(params[:id])
      end  
    end

    def room_params
      params.require(:room).permit(:name)
    end

    
end
