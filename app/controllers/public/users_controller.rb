class Public::UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :ensure_correct_user, only: [:update, :edit, :destroy] #update,edit,destroyは直打ち禁止

  def index
    @users = User.all.page(params[:page]).order("id").page(params[:page]) #kaminariを利用したページネーション
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).order("id").page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    if @user.update(user_params)
      redirect_to public_user_path(@user.id), notice: "プロフィールを更新しました。"
    else
      render 'edit'
    end
  end
  
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
    @posts = Post.all.page(params[:page]).order("id").page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to public_user_path(current_user)
    end
  end


end
