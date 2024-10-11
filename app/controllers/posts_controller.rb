class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    if user_signed_in?
      post = current_user.posts.new(post_params)
      post.post_images.attach(params[:post][:post_images])
      if post.save!
        PostConfirmationMailer.with(user: current_user).post_confirmation_mailer.deliver_later
        redirect_to post
      else
        render :new, notice: "Image succesfully created"
      end
    else
      redirect_to user_session_path
    end
  end

  def destroy
    if user_signed_in?
      post = Post.find(params[:id])
      post.destroy
      redirect_to posts_path
    else
      redirect_to user_session_path
    end
  end

  private
  
  def post_params
    params.require(:post).permit(:post_images, :caption, :user_id)
  end
end
