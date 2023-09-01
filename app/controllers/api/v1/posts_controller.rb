module Api
    module V1
        class Api::V1::PostsController < ApplicationController
            include RecordNotFoundHandler
            def index
                user = User.find(params[:user_id])
                posts = user.posts
                render json: posts
            end
        end
    end
end
