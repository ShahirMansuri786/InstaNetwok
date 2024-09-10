require 'rails_helper'

RSpec.describe RoomsController, type: :controller do
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }
  let(:room) { FactoryBot.create(:room , name: "New room", created_for: user1.id , created_by: user2.id) }

  describe "GET #index" do
    it "assigns all user_infos to @rooms" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:rooms)).to eq(Room.all)
    end
  end

  describe "GET #show" do
    it "rooms# @user_info" do
      get :show, params: { id: room.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:room)).to eq(room)
    end
  end

  describe "GET #new" do
      it "get new @room" do
        get :new
        expect(response).to have_http_status(:success)
        expect(assigns(:room)).to be_a_new(Room)
      end
  end

  describe "room#create" do
    it "creates a new room" do
      post_params = { room: { name: "New room", created_for: user1.id , created_by: user2.id} }
      post :create, params: post_params
      expect(response).to redirect_to(rooms_path)
      expect(Room.last.name).to eq("New room")
    end
  end

  describe "PATCH #update" do
    it "updates the room" do
      patch :update, params: { id: room.id ,  room: { name: "Updated room"} } 
      room.reload
      expect(room.name).to eq("Updated room")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the room" do
      delete :destroy, params: { id: room.id}
      expect(response).to redirect_to(rooms_path)
      expect(Room.exists?(room.id)).to be_falsey
    end
  end
end
