require 'rails_helper'

RSpec.describe LikesController, type: :controller do

  let(:user) { FactoryBot.create(:user) }
  # let(:post) { FactoryBot.create (:post , caption: "Nice picture" , post_images: [], user_id: user.id ) }

  describe "GET #new" do
    it "returns a new instance for new like" do
      post = FactoryBot.create(:post)
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:like)).to be_a_new(Like)
    end
  end

  describe "likes #create" do
    it "creates a new like and redirects to the post" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post, user: user)
      like_params = { like: { likeable: post , user_id: user.id } }
      post :create, params: like_params 
      expect(response).to redirect_to(posts_path)
      expect(Like.last.likeable_id).to eq(post.id)
    end
  end

  describe "DELETE #destroy" do
    it "deletes the like" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      like = FactoryBot.create(:like , user_id: user.id, likeable: post) 
      delete :destroy, params: { id: like.id}
      expect(response).to redirect_to(posts_path)
      expect(Like.exists?(like.id)).to be_falsey
    end
  end
end
