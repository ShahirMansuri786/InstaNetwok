class CommentsController < ApplicationController
        before_action :find_post

        def index
          @comments = Comment.all
        end
      
        def new
          @comment = @post.comments.new()
          
        end
      
        def show
          @comment = Comment.find(params[:id])
        end
      
      
        def create
            
          if user_signed_in?
            @comment = @post.comments.new(comment_params)
      
          if @comment.save!
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
          params.require(:comment).permit(:post_id, :comment_text)
        end

        
        def find_post
            
            @post = Post.find(params[:post_id] )
            
        end
      
      


end
