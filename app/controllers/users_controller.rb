class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def user_edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def user_update
    @user = User.find(params[:id])

    if  @user.update(user_params)
      flash[:success] = "Account updated"
      redirect_back(fallback_location: root_path)
    else
      render :user_edit, status: :unprocessable_entity 
    end
  end

  private
  def user_params
    params.permit(:name , :user_name)

  end

end
