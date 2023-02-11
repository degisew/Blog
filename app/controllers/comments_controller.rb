class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post_id = params[:post_id].to_i
    post = Post.find(post_id)
    text = params[:comment][:text]
    @comment = Comment.new(text:, author: current_user, post:)
    if @comment.save
      flash[:success] = 'Comment created successfully!'
      redirect_to user_posts_url
    else
      flash.now[:error] = 'Oops, Something went wrong!'
      render :new
    end
  end
end
