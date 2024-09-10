require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  # let(:post_params) { { post: { caption: "Nice picture", post_images: [], user_id: user.id } } }

  before do
    sign_in user 
  end

  # describe 'GET #index' do
  #   it 'assigns all posts to @posts' do
  #     post1 = FactoryBot.create(:post, user: user)
  #     post2 = FactoryBot.create(:post, user: user)
  #     get :index
  #     expect(assigns(:posts)).to eq([post1, post2])
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #new" do
    it "returns a new instance for new post" do
      get :new
      expect(response).to have_http_status(:success)
      expect(assigns(:post)).to be_a_new(Post)
    end
  end

  describe "GET #show" do
    it "Post#show" do
      post1 = FactoryBot.create(:post, user: user)
      get :show, params: { id: post1.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:post)).to eq(post1)
    end
  end

  describe "POST #create" do
    it "creates a new post and redirects to the post" do
      post_params = { post: { caption: "New Post", post_images: [Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'files', 'test_image.png'), 'image/png')] } }
      post :create, params: post_params
      expect(response).to redirect_to(Post.last)
      expect(Post.last.caption).to eq("New Post")
    end
  end

  describe "DELETE #destroy" do
    it "deletes the post" do
      post1 = FactoryBot.create(:post, user: user)
      delete :destroy, params: { id: post1.id}
      expect(response).to redirect_to(posts_path)
      expect(Post.exists?(post1.id)).to be_falsey
    end
  end
end
