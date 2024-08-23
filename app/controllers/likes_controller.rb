class LikesController < ApplicationController
  before_action :find_post
  def new 
	  @like = Like.new
  end

  def create
    if user_signed_in?
      @like = @post.likes.create(user_id: current_user.id)
      redirect_to posts_path
    else
	    redirect_to user_session_path
    end
  end

  def destroy
        like = Like.find(params[:id])
        like.destroy
        redirect_to posts_path
  end

	def find_post
      @post = Post.find(params[:post_id])
    end
end


