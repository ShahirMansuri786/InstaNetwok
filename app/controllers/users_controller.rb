class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def user_edit
    @user = User.find(params[:id])
  end

  def show_user
     @user = User.find(params[:id])
     @user_post = Post.where(user_id: @user.id)
     @user_following = Relationship.where(followed_id:@user.id)
     @user_follower = Relationship.where(follower_id:@user.id)
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

  def user_followed
    @user_relation = Relationship.where(followed_id:current_user.id).present?
    @user_followed = Relationship.where(followed_id:current_user.id)
  end

  def user_follower
    @user_relation = Relationship.where(follower_id:current_user.id).present?
    @user_follower = Relationship.where(follower_id:current_user.id)
  end

  def user_search
    @user_present = User.find_by(name:params[:name]).present?
    @user_search = User.find_by(name: params[:name])
  end
  

  private
  def user_params
    params.permit(:name , :user_name)

  end

end
