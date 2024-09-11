require 'rails_helper'

RSpec.describe UserInfosController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:user_info) { FactoryBot.create(:user_info, user: user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "assigns all user_infos to @user_infos" do
      get :index
      expect(response).to have_http_status(:success)
      expect(assigns(:user_infos)).to eq(UserInfo.all)
    end
  end

  describe "GET #show" do
    it "user_infos# @user_info" do
      get :show, params: { id: user_info.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:user_info)).to eq(user_info)
    end
  end

  describe "GET #new" do
    context "when user_signed in" do
      it "get new  @user_info" do
        get :new
        expect(response).to have_http_status(:success)
        expect(assigns(:user_info)).to be_a_new(UserInfo)
      end
    end

    context "when not signed in" do
      before { sign_out user }
      it "redirects to the sign-in page" do
        get :new
        expect(response).to redirect_to(user_session_path)
      end
    end
  end

  describe "GET #edit" do
    it "get @user_info" do
      get :edit, params: { id: user_info.id }
      expect(response).to have_http_status(:success)
      expect(assigns(:user_info)).to eq(user_info)
    end
  end

  describe "UserInfo #create" do
    context "when user_signed in" do
      it "creates a new user_info and redirects to the user registration path" do
        post_params = { user_info: { bio: "New Bio", user_id: user.id } }
        post :create, params: post_params
        expect(response).to redirect_to(posts_path)
        expect(UserInfo.last.bio).to eq("New Bio")
      end

      # it "renders the new template if the user_info is invalid" do
      #   post_params = { user_info: { bio: "", user_id: user.id } }
      #   post :create, params: post_params
      #   expect(response).to render_template(new_user_info_path)
      # end

    context "when not signed in" do
      before { sign_out user }
        it "redirects to the sign-in page" do
          post_params = { user_info: { bio: "New Bio", user_id: user.id } }
          post :create, params: post_params
          expect(response).to redirect_to(user_session_path)
        end
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the user_info and redirects back" do
        patch :update, params: { id: user_info.id, user_info: { bio: "Updated Bio" } }
        user_info.reload
        # expect(response).to redirect_back(fallback_location: root_path)
        expect(user_info.bio).to eq("Updated Bio")
      end
    end

    context "with invalid parameters" do
      it "renders the edit template with errors" do
        patch :update, params: { id: user_info.id, user_info: { bio: "" } }
        expect(response).to render_template(:edit)
        expect(assigns(:user_info)).to eq(user_info)
      end
    end
  end

  describe "DELETE #destroy" do
    context "when signed in" do
      it "destroys the user_info and redirects to the index" do
        delete :destroy, params: { id: user_info.id }
        expect(response).to redirect_to(user_infos_path)
        expect(UserInfo.exists?(user_info.id)).to be_falsey
      end
    end

    context "when not signed in" do
      before { sign_out user }

      it "redirects to the sign-in page" do
        delete :destroy, params: { id: user_info.id }
        expect(response).to redirect_to(user_session_path)
      end
    end
  end
end
