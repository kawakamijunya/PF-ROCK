class Public::PostCommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.post_comments.new(post_comments_params)
    @comment.post.id = @post.id
    @comment.save
  end
  
  def destroy
    PostComment.find_by(id: params[:id], post_id: params[:post_id]).destroy
  end
  
  private
  
  def post_comments_params
    params.require(:post_comment).permit(:comment)
  end
  
end
