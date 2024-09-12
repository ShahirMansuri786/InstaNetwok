require 'rails_helper'

RSpec.describe MessagesController, type: :controller do
  
	describe 'MessagesController#index' do
		it 'assigns all comments to @messages' do
      user = FactoryBot.create(:user)
      room = FactoryBot.create(:room , created_by: user.id , created_for: user.id)
			message1 = FactoryBot.create(:message , user_id: user.id , room_id: room.id )
			message2 = FactoryBot.create(:message , user_id: user.id , room_id: room.id )
			process :index, method: :get
			expect(assigns(:messages)).to match_array([message1 , message2])
      # expect(response).to redirect_to(room_path(room.id))
			expect(response).to have_http_status(:success)
		end
  end

  describe "MessagesController#create" do
    it "creates a new message and redirects to the room" do
      user = FactoryBot.create(:user)
      room = FactoryBot.create(:room , created_by: user.id , created_for: user.id)
      process :create, method: :post ,  params: { message: {content: "Nice" , user_id: user.id , room_id: room.id } }
      expect(response).to redirect_to(room)
      expect(Message.last.content).to eq("Nice")
    end
  end
  
  describe "MessagesController#new" do
		it "returns a new instance for new message" do
      room = FactoryBot.create(:room , created_by: 1 , created_for: 2)
			process :new, method: :get ,  params: {room_id: room.id}
			expect(assigns(:message)).to be_a_new(Message)
			expect(response).to have_http_status(:success)
		end
	end

  describe "MessagesController#update" do
    it "returns a updated message" do
      room = FactoryBot.create(:room , created_by: 1 , created_for: 2)
      message = FactoryBot.create(:message , user_id: 1 , room_id: room.id)
      patch :update,   params: { id: message.id , message: {content: "Nice" , user_id: 1 , room_id: room.id} } 
      message.reload
      expect(message.content).to eq("Nice")
      expect(response).to have_http_status(:success)
    end
  end

  describe "MessagesController#delete" do
		it "message#delete" do
      room = FactoryBot.create(:room , created_by: 1 , created_for: 2)
      message = FactoryBot.create(:message , user_id: 1 , room_id: room.id)
			process :destroy, method: :delete ,  params: { id: message.id }
			expect(Message.exists?(message.id)).to be_falsey
		end
	end

end
