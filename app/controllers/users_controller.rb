class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def user_edit
    @user = User.find(params[:id])
  end

  def show
    # @user = User.find(params[:id])
    # @relation = @user.followers.find_by(follower: current_user)
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

  # def user_followed
  #   @user_followed = Relationship.where(follower_id:current_user.id)
  # end

  def user_search
    @user_present = User.find_by(name:params[:name]).present?
    @user_search = User.find_by(name: params[:name])
 
  end

  private
  def user_params
    params.permit(:name , :user_name)

  end

end
