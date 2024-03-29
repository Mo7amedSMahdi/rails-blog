class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: true

  after_initialize :set_defaults

  def self.three_most_recent_posts(author_id)
    Post.where(author_id).order(created_at: :desc).limit(3).all
  end

  def recent_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def set_defaults
    self.posts_counter ||= 0
  end
end
