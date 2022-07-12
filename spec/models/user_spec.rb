require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Mohammed', bio: 'This is my bio', posts_counter: 0) }
  before(:all) do
    Rails.application.load_seed
  end
  before { subject.save }

  it 'Name should not be empty or nil' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Lenth should be three' do
    posts = User.three_most_recent_posts(User.first.id)
    expect(posts.length).to eq(3)
  end

  it 'PostsCounter should not be below 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'PostsCounter should not be a string' do
    subject.posts_counter = 'My string'
    expect(subject).to_not be_valid
  end
end
