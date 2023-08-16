# app/models/user.rb
class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  def recent_posts(limit = 3)
    posts.order(created_at: :desc).limit(limit)
  end
end
