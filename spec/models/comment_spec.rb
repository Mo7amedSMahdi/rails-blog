require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    Rails.application.load_seed
  end

  it 'CommentCounter for first user, first post equal 2' do
    Comment.update_post_comments_counter(User.first.posts.first.id)
    Comment.update_post_comments_counter(User.first.posts.first.id)
    comments = User.first.posts.first.comments_counter
    expect(comments).to eq(2)
  end
end
