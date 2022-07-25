require 'rails_helper'

RSpec.describe 'posts#index', type: :feature do
  describe 'Post' do
    before(:all) do
      @user = User.first!
      @post1 = Post.first!
      @post2 = Post.second!
      @post3 = Post.third!
    end

    it "shows user's profile picture" do
      visit(user_posts_path(@user.id))
      expect(page).to have_css('img[src*="https://dummyimage.com/600x400/000/fff"]')
    end

    it 'shows the users username' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content('mohammed')
    end

    it 'shows number of posts of user has written' do
      visit(user_posts_path(@user.id))
      post = Post.all
      expect(post.size).to eql(7)
    end

    it 'shows number of posts by user' do
      visit(user_posts_path(@user.id))
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it 'shows posts title' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content('Ruby and Rails 1')
    end

    it 'can see some of the post detail' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'this is first post about Ruby and Rails! 1'
    end

    it 'can see the first comment on a post' do
      visit(user_posts_path(@user.id))
      expect(page).to have_content 'Well Done 👏👏👏'
    end

    it "redirects the user to the post's show page after clickin on it" do
      visit(user_posts_path(@user.id))
      click_link 'Ruby and Rails 1'
      expect(page).to have_current_path user_post_path(@post1.author_id, @post1)
    end
  end
end
