class Like < ApplicationRecord
  belongs_to :author_id, class_name: 'User'
  belongs_to :post_id, class_name: 'Post'

  def update_post_likes
    post = Post.find(post_id.id)
    post.increment!(:likes_counter)
    post.save
  end
end
