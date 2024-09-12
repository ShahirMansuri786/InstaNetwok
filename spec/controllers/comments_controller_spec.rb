require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  let(:post) { FactoryBot.create(:post) }
	let(:user) { FactoryBot.create(:user) }
	
	before do
    sign_in user
  end

	describe 'CommentsController#index' do
		it 'assigns all comments to @post_comments' do
			post = FactoryBot.create(:post)
			comment1 = FactoryBot.create(:comment , post: post)
			comment2 = FactoryBot.create(:comment , post: post )
			process :index, method: :get ,  params: {post_id: post.id}
			expect(assigns(:post_comments)).to match_array([comment1 , comment2])
			expect(response).to have_http_status(:success)
		end
  end

	describe "CommentsController#new" do
		it "returns a new instance for new comment" do
			process :new, method: :get ,  params: {post_id: post.id}
			expect(assigns(:post_comment)).to be_a_new(Comment)
			expect(response).to have_http_status(:success)
		end
	end

	describe "CommentsController#show" do
		it "comments#show" do
			post = FactoryBot.create(:post)
			comment = FactoryBot.create(:comment , post: post)
			process :show, method: :get ,  params: { id: comment.id , post_id: post.id }
			expect(response).to have_http_status(:success)
			expect(assigns(:post_comment)).to eq(comment)
		end
	end

	describe "CommentsController#create" do
		context "when user signed in" do 
			it "creates a new comment and redirects to the post" do
				post = FactoryBot.create(:post)
				process :create, method: :post ,  params: { comment_text: "Nice" ,   post_id: post.id }
				expect(response).to redirect_to(post)
				expect(Comment.last.comment_text).to eq("Nice")
			end
		end
  end

	describe "CommentsController#delete" do
		it "comments#delete" do
			post = FactoryBot.create(:post)
			comment = FactoryBot.create(:comment , post: post)
			process :destroy, method: :delete ,  params: { id: comment.id , post_id: post.id}
			expect(Comment.exists?(comment.id)).to be_falsey
		end
	end
end
