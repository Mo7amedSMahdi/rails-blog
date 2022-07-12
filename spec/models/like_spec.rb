require 'rails_helper'

RSpec.describe Like, type: :model do
  before(:all) do
    Rails.application.load_seed
  end

  it 'LikesCounter for first user, first post equal 2' do
    Like.update_post_likes_counter(User.first.posts.first.id)
    Like.update_post_likes_counter(User.first.posts.first.id)
    likes = User.first.posts.first.likes_counter

    expect(likes).to eq(2)
  end
end
