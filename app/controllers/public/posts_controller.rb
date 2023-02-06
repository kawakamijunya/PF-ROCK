class Public::PostsController < ApplicationController
  before_action :authenticate_user! #ログインしているユーザーのみ
  before_action :ensure_correct_user, only: [:update,:edit,:destroy] #update,edit,destroyは直打ち禁止

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end
  
  def create 
    @post = Post.new(post_params)
    @post.user.id = current_user.id
    if @post.save
      redirect_to post_path(@post.id), notice: "投稿に成功しました。"
    else
      render 'new'
  end 

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @posts = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path_(@post), notice: "投稿の編集に成功しました。"
    else
      render 'edit'
    end 
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title,:caption,:user_id)
  end
  
  def ensure_correct_user
    @post = Post.find(params[:id])
    @user = @post.user
    unless @user == current_user
      redirect_to posts_path
    end
  end

end
