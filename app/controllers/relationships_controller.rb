class RelationshipsController < ApplicationController
  
  def create
    if user_signed_in?
       other_user = User.find(params[:user_id])
       @relation = Relationship.new(follower_id:current_user.id , followed_id:other_user.id )
      if @relation.save
       redirect_to posts_path
      end
    else
    redirect_to user_session_path
     end

  end

  def destroy
    @relation = Relationship.find(params[:id])
    @relation.destroy
    redirect_to posts_path
  end
end
