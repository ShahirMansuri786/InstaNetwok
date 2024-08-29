class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = ChatMessage.where(sender_id: current_user.id , receiver_id: 12).order(:created_at)
  end

  def create
    @message = ChatMessage.new(chat_message_params)
    

    if @message.save
      ActionCable.server.broadcast 'chat_channel' ,
      {
        message: @message.content,
        sender: current_user.name,
        receiver_id: @message.receiver_id
      }
    else
      render :index
    end
  end

  private

  def chat_message_params
    params.permit(:content , :receiver_id , :sender_id)
  end

  def render_message(message)
    ApplicationController.renderer.render(partial: 'chats/chat_message', locals: { message: message })
  end
end


