class UserInfosController < ApplicationController
  before_action :set_user_info, only: %i[ show edit update destroy ]

 
  def index
    @user_infos = UserInfo.all
  end

  
  def show
    @user_info = UserInfo.find(params[:id])
  end

  def new
    if user_signed_in?
    @user_info = UserInfo.new
  else
    redirect_to user_session_path
  end
  end

  def edit
    @user_info = UserInfo.find(params[:id])
  end


  
  def create
    if user_signed_in?
      #has_one
      @user_info = current_user.create_user_info(user_info_params)
    
      if @user_info
        redirect_to user_registration_path       
      else
       render :new
      end
    else 
      redirect_to user_session_path
   end 
    end
  

  
  def update
      if @user_info.update(user_info_params)
        redirect_back(fallback_location: root_path )
      else
        render :edit, status: :unprocessable_entity 
      end
    end

  
 
  def destroy
  if user_signed_in?
    @user_info = UserInfo.find(params[:id])
    @user_info.destroy
    redirect_to user_infos_path
  else
    redirect_to user_session_path
    end
  end


  private
  
  def set_user_info
    @user_info = UserInfo.find(params[:id])
  end

  
  def user_info_params
    params.require(:user_info).permit(:bio , :user_id)
  end
end
