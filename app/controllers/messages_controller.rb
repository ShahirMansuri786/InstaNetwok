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
    @message = Message.new(message_params)
      if @message.save
        redirect_to request.referrer
      else
      end
  end

  def update
    if @message.update(message_params)
    else
    end
  end

  def destroy
    @message.destroy!
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:content, :user_id, :room_id)
    end
end
