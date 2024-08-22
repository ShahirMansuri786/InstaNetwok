class LikesController < ApplicationController
  before_action :find_post
  def new 
	  @like = Like.new
  end

  def create
    if user_signed_in?
      @like = @post.likes.new
        if @like.save! 
        else
		      render :new, notice: "Like succesfully created"
	      end
    else
	    redirect_to user_session_path
    end
  end

	def find_post
      @post = Post.find(params[:post_id])
    end
end


