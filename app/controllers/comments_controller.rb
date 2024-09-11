class CommentsController < ApplicationController
  before_action :find_post
  before_action :authenticate_user! 

  def index
    @post_comments = @post.comments.all
  end
      
  def new
    @post_comment = @post.comments.new()
  end
      
  def show
    @post_comment = @post.comments.find(params[:id])
  end

  def create
    if user_signed_in?
      post_comment = @post.comments.new(comment_params)
      if post_comment.save!
        redirect_to @post
      else
        render :new, notice: "Image succesfully created"
      end
    else
      redirect_to user_session_path
    end
  end
  
  def destroy
    if user_signed_in?
      comment = Comment.find(params[:id])
      comment.destroy
      redirect_to post_path(params[:post_id])
    else
      redirect_to user_session_path
    end
  end

  private

  def comment_params
    params.permit(:comment_text , :user_id )
  end

  def find_post
    @post = Post.find(params[:post_id] ) 
  end     
end
