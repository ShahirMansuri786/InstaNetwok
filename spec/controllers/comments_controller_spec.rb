require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:post) { FactoryBot.create(:post) }
	let(:user) { FactoryBot.create(:user) }
	# let(:post) { FactoryBot.create (:post , caption: "Nice picture" , post_images: [], user_id: user.id ) }

	describe 'GET #index' do
		it 'assigns all comments to @comments' do
			comment1 = FactoryBot.create(:comment )
			comment2 = FactoryBot.create(:comment )
			get :index
			expect(assigns(:post_comments)).to match_array([comment])
			expect(response).to have_http_status(:success)
		end
  end

	describe "GET #new" do
		it "returns a new instance for new comment" do
			comment = FactoryBot.create(:comment , post: post)
			get :new
			expect(response).to have_http_status(:success)
			expect(assigns(:comment)).to be_a_new(Comment)
		end
	end

	describe "GET #show" do
		it "comments#show" do
			comment = FactoryBot.create(:comment)
			get :show, params: { id: comment.id }
			expect(response).to have_http_status(:success)
			expect(assigns(:comment)).to eq(comment)
		end
	end

	describe "comments#create" do
    it "creates a new comment and redirects to the post" do
      comment = FactoryBot.create(:comment, user_id: user.id)
      post :create , params: comment
      expect(response).to redirect_to(post)
      expect(Comment.last.comment_text).to eq(comment.comment_text)
    end
  end
end
