class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @current_user = User.find_by!(id: params[:user_id])
    @posts = Post.where(author_id: @current_user)
  end

  def new
    @new_post = Post.new
  end

  def show
    @current_user = User.find_by!(id: params[:user_id])
    @posts = Post.where(author_id: @current_user)
    @post = @posts.find(params[:id])
  end

  def create
    title = params[:post][:title]
    text = params[:post][:text]
    @post = Post.new(title:, text:, comments_counter: 0, likes_counter: 0, author: current_user)
    if @post.save
      flash[:success] = 'Post saved successfully.'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Error: Post could not be saved'
      render :new
    end
  end
end
