class Like < ApplicationRecord
  belongs_to :author_id, class_name: 'User'
  belongs_to :post_id, class_name: 'Post'

  def update_post_likes
    post = Post.find(post_id.id)
    post.likes_counter ? post.likes_counter += 1 : post.likes_counter = 1
    post.save
  end
end
