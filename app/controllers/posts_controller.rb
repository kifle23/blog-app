class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(:posts).find(params[:user_id])
  end

  def show
    @post = User.includes(posts: [:author]).find(params[:user_id]).posts.find(params[:id])
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
          render :new
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    Comment.where(post_id: @post.id).destroy_all
    Like.where(post_id: @post.id).destroy_all
    @post.destroy
    flash[:success] = 'You deleted this post'
    redirect_to user_path(@post.author), notice: 'Post Deleted!'
  end

  private

  def post_params
    params.require(:add_post).permit(:title, :text)
  end
end
