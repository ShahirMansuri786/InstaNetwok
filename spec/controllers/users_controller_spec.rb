require 'rails_helper'

RSpec.describe UsersController, type: :controller do

	describe 'UsersController#index' do
		it 'assigns all comments to @users' do
			user1 = FactoryBot.create(:user)
			user2 = FactoryBot.create(:user)
			process :index, method: :get 
			expect(response).to have_http_status(:success)
		end
	end

	describe "UsersController#edit" do
    it "get @user" do
			user = FactoryBot.create(:user)
      process :user_edit, method: :get , params: { id: user.id}
      expect(response).to have_http_status(:success)
      expect(assigns(:user)).to eq(user)
    end
  end

	describe "UsersController#show" do
		it "UsersController#show" do
			user = FactoryBot.create(:user)
			user_profile = FactoryBot.create(:user_profile , user_id: user.id)
			process :show_user, method: :get ,  params: { id: user.id}
			expect(response).to have_http_status(:success)
			expect(assigns(:user)).to eq(user)
		end
	end

	describe "UsersController#update" do
		it "updates user" do
			user = FactoryBot.create(:user)
			process :user_update, method: :patch , params: { id: user.id, user: { name: "Updated" , user_name: "Shahir" } }
			user.reload
			expect(user.name).to eq("Updated")
		end  
  end

end