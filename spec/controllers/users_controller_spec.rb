require 'rails_helper'

RSpec.describe UsersController, type: :controller do
	let(:user) { FactoryBot.create(:user) }
	
	before do
    sign_in user
  end

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
			process :user_update, method: :patch , params: { id: user.id, name: "Updated" , user_name: "Shahir" } 
			user.reload
			expect(user.name).to eq("Updated")
		end  
  end

	describe "UsersController#user_search" do
		it "search user by name" do
			user = FactoryBot.create(:user)
			process :user_search, method: :get , params: { name: user.name }
			expect(assigns(:user_search)).to eq(user)
			expect(User.last.name).to eq(user.name)
		end  
  end

	describe "UsersController#user_followed" do
		it "find user_followed" do
			user2 = FactoryBot.create(:user)
			relation1 = FactoryBot.create(:relationship , follower_id: user2.id , followed_id: user.id)
			relation2 = FactoryBot.create(:relationship , follower_id: user2.id , followed_id: user.id)
			process :user_followed, method: :get , params: { followed_id: user.id }
			expect(assigns(:user_followed)).to match_array([relation1 , relation2])
		end  
  end

	describe "UsersController#user_follower" do
		it "find user_follower" do
			user2 = FactoryBot.create(:user)
			relation1 = FactoryBot.create(:relationship , follower_id: user.id , followed_id: user2.id)
			relation2 = FactoryBot.create(:relationship , follower_id: user.id , followed_id: user2.id)
			process :user_follower, method: :get , params: { follower_id: user.id }
			expect(assigns(:user_follower)).to match_array([relation1 , relation2])
		end  
  end
end
