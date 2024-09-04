class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]

  def index
    @rooms = Room.all
  end

  def show
    #@rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def edit
  end

  def create
    room = Room.new(room_params)
    room.save
  end

  def update
    @room.update(room_params)
  end

  def destroy
    @room.destroy!
  end

  private
    def set_room
      if Room.any?
        @room = Room.find(params[:id])
      end  
    end

    def room_params
      params.require(:room).permit(:name , :created_by , :created_for )
    end  
end
