class CommentsController < ApplicationController
    def index
      @comments = Comment.all
    end
     def show
      @post = Post.find(params[:post_id])
      @comment = Comment.find(params[:id])
     end

    def create
      @post = Post.find(params[:post_id])
      @comment = @post.comments.new(comment_params)
        if @comment.save
          PostsChannel.broadcast_to(@post, @comment.body)
          redirect_to @post, notice: "Comment was successfully created."
        else
         # render :new
        end
    end

    def comment_params
      params.require(:comment).permit(:title, :body)
    end

end
