class Admin::UsersController < ApplicationController

  def index
    @users = User.all.order("id").page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("id").page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_users_path, notice: "更新しました。"
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :is_deleted)
  end

end
