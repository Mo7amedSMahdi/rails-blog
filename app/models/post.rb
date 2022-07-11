class Post < ApplicationRecord
  belongs_to :author_id, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'

  def update_post_counter
    user = User.find(author_id.id)
    user.post_counter ? user.post_counter += 1 : user.post_counter = 1
    user.save
  end

  def five_most_recent_comments
    Comment.where(post_id:id).order(created_at: :desc).limit(5)
  end
end
