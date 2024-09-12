require 'rails_helper'

RSpec.describe "Comments", type: :request do
  let(:post) { FactoryBot.create(:post) }
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end
  
  describe "GET /posts/:post_id/comments/new " do
    it "works! (now write some real specs)" do
      get new_post_comment_path(post)
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /posts/:post_id/comments" do
    it "returns a successful response and displays the list of comments" do
      @comments = FactoryBot.create_list(:comment, 3, post: post, user_id: user.id)
      get post_comments_path(post)
      expect(response).to have_http_status(:success)
      @comments.each do |comment|
        expect(response.body).to include(comment.comment_text)
      end
    end
  end

	describe "GET /posts/:post_id/comments/:id" do
		it "comments#show" do
			comment = FactoryBot.create(:comment , post: post)
			get "/posts/#{comment.post_id}/comments/#{comment.id}"
			expect(response).to have_http_status(:success)
			expect(assigns(:post_comment)).to eq(comment)
		end
	end


  describe "Post /posts/:post_id/comments" do
    
    it "creates a new comment and redirects to the post" do
      post = FactoryBot.create(:post )
      user = FactoryBot.create(:user) 

      comment_attributes = FactoryBot.attributes_for(:comment, user_id: user.id)
      # comment = FactoryBot.create(:comment, user_id: user.id )
      # post post_comments_path(post.id) , params: { comment: {comment_text: "Nice" , user_id: user.id} }
      
      process :create, method: :post ,  params: (comment_attributes) 

      expect(response).to redirect_to(post)
      expect(Comment.last.comment_text).to eq("Nice")
    end
  end

  describe "DELETE #destroy" do

    context "when user signed in" do
      it "deletes the post" do
        post = FactoryBot.create(:post )
        comment = FactoryBot.create(:comment, user_id: user.id , post: post)
        delete  "/posts/#{post.id}/comments/#{comment.id}"
        expect(response).to redirect_to(post_path(post.id))
        expect(Comment.exists?(comment.id)).to be_falsey
      end
    end

    context "when not signed in" do
      before { sign_out user }
      it "redirects to the sign-in page" do
        delete  "/posts/#{post.id}/comments/#{comment.id}"
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

end
