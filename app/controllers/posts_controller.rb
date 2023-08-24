class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
  end

  def show
    @post = User.find(params[:user_id]).posts.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    new_post = current_user.posts.new(post_params)
    new_post.comments_counter = 0
    new_post.likes_counter = 0
    @post = new_post

    respond_to do |format|
      if new_post.save
        format.html do
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_url
        end
      else
        format.html do
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
