class UserProfilesController < ApplicationController
    def new
      @user_profile = UserProfile.new
    end
    
    def show
      @user_profile = UserProfile.find(params[:id])
    end
    
    def create
      if user_signed_in?
        user_profile = current_user.create_user_profile(user_profile_params)
        user_profile.profile_image.attach(params[:profile_image])
        
        if user_profile.save!
          redirect_to posts_path
        else
          render :new, notice: "Image succesfully created"
        end
      else
        redirect_to user_session_path
      end
    end

    def edit 
      @user_profile = UserProfile.find_by(id: params[:id])
    end

    def update
      user_profile = UserProfile.find(params[:id])
      if user_profile.update(user_profile_params)
        redirect_to posts_path
      end
    end

    private

    def user_profile_params
      params.permit(:profile_image)
    end
end
