require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  before do
    sign_in user
  end

  describe "LikesController#new" do
    it "returns a new instance for new like" do
      post = FactoryBot.create(:post)
      like = FactoryBot.create(:like , likeable: post)
      process :new, method: :get ,  params: { id: like.id, post_id: post.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:like)).to be_a_new(Like)
    end
  end

  describe "LikesController#create" do
    it "creates a new like and redirects to the post" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user: user)
      process :create, method: :post ,  params: { user_id: user.id, post_id: post.id }
      expect(response).to redirect_to(posts_path)
      expect(Like.last.likeable_id).to eq(post.id)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the like" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      like = FactoryBot.create(:like , user_id: user.id, likeable: post) 
      process :destroy, method: :delete, params: { id: like.id , post_id: post.id}
      expect(response).to redirect_to(posts_path)
      expect(Like.exists?(like.id)).to be_falsey
    end
  end
end
