class PostsController < ApplicationController
  def index
    @current_user = User.find_by!(id: params[:user_id])
    @posts = Post.where(author_id: @current_user)
  end

  def show
    @current_user = User.find_by!(id: params[:user_id])
    @posts = Post.where(author_id: @current_user)
    @post = @posts.find(params[:id])
  end
end
