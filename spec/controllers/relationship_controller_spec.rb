require 'rails_helper'

RSpec.describe RelationshipsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
	
	before do
    sign_in user
  end

  describe 'RelationshipsController#create' do
    context "when user sign in" do
      it 'create relation' do
        user2 = FactoryBot.create(:user)
        process :create, method: :post ,  params: { user_id: user2.id}
        expect(response).to redirect_to(posts_path)
        expect(Relationship.last.follower_id).to eq(user.id)
        expect(Relationship.last.followed_id).to eq(user2.id)
        expect(response).to have_http_status(302)
      end
    end
    context "when sign out" do
      before {sign_out user}
      it "redrect_to login path" do
        user2 = FactoryBot.create(:user)
        process :create, method: :post ,  params: { user_id: user2.id}
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  describe "RelationshipsController#delete" do
		it "Relation#delete" do
      user2 = FactoryBot.create(:user)
			relation = FactoryBot.create(:relationship , follower_id: user.id , followed_id: user2.id)
			process :destroy, method: :delete ,  params: { id: relation.id }
			expect(Relationship.exists?(relation.id)).to be_falsey
      expect(response).to redirect_to(posts_path)
		end
	end

end