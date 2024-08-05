class CommentsController < ApplicationController

    class PostsController < ApplicationController

  
        def index
          @comments = Comment.all
        end
        
      
      
        def new
          @comment = Comment.new
        end
      
        def show
          @comment = Comment.find(params[:id])
        end
      
      
        def create
          if user_signed_in?
            @comment = @post.comments.new
      
          if @post.save!
            redirect_to @comment
          else
            render :new, notice: "Image succesfully created"
          end
          else
          redirect_to user_session_path
          end
        end
      
        def destroy
      
        if user_signed_in?
          @comment = Comment.find(params[:id])
          @comment.destroy
          redirect_to comments_path
        else
          redirect_to user_session_path
          end
        end
       
      
      
        private
      
        def comment_params
          params.require(:comment).permit(:comment_text , :post_id)
        end
      
      end
      


end
