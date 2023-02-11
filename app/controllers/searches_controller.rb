class SearchesController < ApplicationController
  before_action :authenticate_user!
   
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "User"
      @users = User.looks(params[:search],params[:word])
      render "/searches/search_result"
    else
      @posts = Post.looks(params[:search],params[:word])
      render "/searches/search_result"
    end
    @users = User.all.page(params[:page]).order("id").page(params[:page])
    @posts = Post.all.page(params[:page]).order("id").page(params[:page])
  end
  
end
