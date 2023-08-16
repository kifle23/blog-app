# app/models/comment.rb
class Comment < ApplicationRecord
    belongs_to :author, class_name: 'User'
    belongs_to :post
  
    after_create :update_post_comments_counter
  
    def update_post_comments_counter
      post.update_comments_counter
    end
end