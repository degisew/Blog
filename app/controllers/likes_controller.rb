class LikesController < ApplicationController
  def create
    post_id = params[:post_id].to_i
    post = Post.find(post_id)
    like = Like.new(author: current_user, post:)
    if like.save
      redirect_to user_posts_url
    else
      flash[:error] = 'Oops, Something went wrong!'
      render user_posts_path
    end
  end
end
