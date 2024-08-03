class LikesController < ApplicationController

	def new 
		@like = Like.new
	end

  def create
		if user_signed_in?
			@like = current_user.likes.new(like_params)
	
    if @like.save!
				redirect_to @like
    else
				render :new, notice: "Like succesfully created"
		end
	  end
	end

	end


