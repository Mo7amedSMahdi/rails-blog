class Post < ApplicationRecord
  belongs_to :author_id, class_name: 'User'
  has_many :likes, foreign_key: 'post_id'
  has_many :comments, foreign_key: 'post_id'
  after_save :update_post_counter

  def five_most_recent_comments
    Comment.where(post_id: id).order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    user = User.find(author_id.id)
    user.increment!(:post_counter)
    user.save
  end
end
