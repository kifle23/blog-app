class Api::V1::CommentsController < ApplicationController
    def index
      user = User.find(params[:user_id])
      post = user.posts.find(params[:post_id])
      comments = post.comments
      render json: comments
    end
end