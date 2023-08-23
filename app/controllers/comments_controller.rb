class CommentsController < ApplicationController
    def create
      post = Post.find(params[:post_id])
      p post
      comment = current_user.comments.new(comments_params)
      comment.post = post
      if comment.save
        flash[:success] = 'Successfully commented on this post'
        redirect_to user_post_url(id: params[:post_id])
      else
        flash.now[:error] = 'Error: Post could not be created'
        render user_post_path(id: current_user.id)
      end
    end

    private
  
    def comments_params
      params.require(:add_comment).permit(:text)
    end
end
  