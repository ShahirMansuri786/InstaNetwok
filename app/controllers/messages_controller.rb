class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show edit update destroy ]

  def index
    @messages = Message.all
  end

  def show
  end

  def new
    @message = Message.new
  end

  def edit
  end

  def create
    message = Message.new(message_params)
    if message.save
      ActionCable.server.broadcast "room_channel_#{message.room_id}" ,{ message: message.content}
      redirect_to room_path(message.room_id)
    end
  end

  def update
    @message.update(message_params)
  end

  def destroy
    if @message.destroy!
      redirect_to room_path(@message.room_id)
    end
  end

  private
  
  def set_message
    @message = Message.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :room_id)
  end
end
