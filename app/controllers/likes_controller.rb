class LikesController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    user_like = current_user.likes.new(post:)
    if user_like.save
      flash[:success] = 'You liked this post'
      redirect_to user_post_url(id: params[:post_id])
    else
      flash.now[:error] = 'Error: Post could not be created'
      render user_post_path(id: current_user.id)
    end
  end
end
