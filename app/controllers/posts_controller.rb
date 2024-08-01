class PostsController < ApplicationController

  def index
  @post = Post.all
  end

  
  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end


  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, notice: "Image succesfully created"
    end
  end

  private

  def post_params
    params.require(:post).permit(:post_images, :caption)
  end

end
