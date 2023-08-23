class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def create
    new_post = current_user.posts.new(post_params)
    new_post.comments_counter = 0
    new_post.likes_counter = 0
    respond_to do |format|
      format.html do
        if new_post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_url
        else
          flash.now[:error] = 'Error: Post could not be created'
          render :new, locals: { post: new_post }
        end
      end
    end
  end

  private

  def post_params
    params.require(:add_post).permit(:title, :text)
  end
end
