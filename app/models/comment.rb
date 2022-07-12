class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post, class_name: 'Post'

  def self.update_post_comments_counter(post_id)
    p = Post.find(post_id)
    p.comments_counter += 1
    p.save
  end
end
