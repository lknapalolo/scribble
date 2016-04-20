class CommentsController < ApplicationController
  def show
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment= @post.comments.update(comment_params)
    redirect_to post_comment_path(@comment)
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     @comment.destroy
     redirect_to post_path(@post)
   end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
