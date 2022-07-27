class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comment, foreign_key: 'post_id', dependent: :destroy
  has_many :like, foreign_key: 'post_id', dependent: :destroy

  after_save :update_post_counter
  before_destroy :update_posts_counter_on_destroy

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: true

  def self.update_user_posts_counter(author_id)
    u = User.find(author_id)
    u.posts_counter += 1
    u.save
  end

  def self.five_recent_comments(author_id, post_id)
    Comment.where(author_id, post_id).order(created_at: :desc).limit(5)
  end

  def recent_comments
    comment.order(created_at: :desc).limit(5)
  end

  private

  def update_post_counter
    user = User.find(author.id)
    user.increment!(:posts_counter)
    user.save
  end

  def update_posts_counter_on_destroy
    user = User.find(author.id)
    user.decrement!(:posts_counter)
    user.save
  end
end
