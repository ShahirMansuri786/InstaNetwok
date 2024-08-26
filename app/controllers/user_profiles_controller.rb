class UserProfilesController < ApplicationController
    def new
      @user_profile = UserProfile.new
    end
    
    def show
      @user_profile = UserProfile.find(params[:id])
    end
    
    def create
      if user_signed_in?
        @user_profile = current_user.create_user_profile(user_profile_params)
        @user_profile.profile_image.attach(params[:profile_image])
    
        if @user_profile.save!
          
        else
          render :new, notice: "Image succesfully created"
        end
      else
        redirect_to user_session_path
      end
    end

      private
    
      def user_profile_params
        params.permit(:profile_image)
      end
    
    end
    