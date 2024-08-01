class UserInfosController < ApplicationController
  before_action :set_user_info, only: %i[ show edit update destroy ]

  # GET /user_infos 
  def index
    @user_infos = UserInfo.all
  end

  # GET /user_infos/1 
  def show
    @user_info = UserInfo.find(params[:id])
  end

  # GET /user_infos/new
  def new
    @user_info = UserInfo.new
  end

  # GET /user_infos/1/edit
  def edit
  end

  # POST /user_infos 

  
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
  
  # PATCH/PUT /user_infos/1
  
  def update
      if @user_info.update(user_info_params)
        redirect_to @user_info
      else
        render :edit, status: :unprocessable_entity 
      end
    end

  
  # DELETE /user_infos/1 
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
  # Use callbacks to share common setup or constraints between actions.
  def set_user_info
    @user_info = UserInfo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_info_params
    params.require(:user_info).permit(:bio , :user_id)
  end
end
