require 'rails_helper'

RSpec.describe 'user#Show', type: :feature do
  describe 'User' do
    before(:each) do
      @mohammed = User.create!(
        name: 'mohammed',
        photo: 'msMod.jpeg',
        bio: 'Lorem ipsum dolor sit amet',
        posts_counter: 0
      )

      @tom = User.create!(
        name: 'tom',
        photo: 'msMod.jpeg',
        bio: 'Lorem ipsum dolor sit amet',
        posts_counter: 0
      )

      visit root_path

      @post1 = mohammed.posts.create!(title: 'Ruby and Rails 1', text: 'this is first post about Ruby and Rails! 1',
                                      comments_counter: 0, likes_counter: 0)
      @post2 = mohammed.posts.create!(title: 'Ruby and Rails 2', text: 'this is first post about Ruby and Rails! 2',
                                      comments_counter: 0, likes_counter: 0)
      @post3 = mohammed.posts.create!(title: 'Ruby and Rails 3', text: 'this is first post about Ruby and Rails! 3',
                                      comments_counter: 0, likes_counter: 0)

      visit user_path(@mohammed.id)
    end
    it "show user's profile picture" do
      all('img').each do |i|
        expect(i[:src]).to eq('msMod.png')
      end
    end

    it "show user's name" do
      expect(page).to have_content 'mohammed'
    end

    it 'show number of posts per user' do
      user = User.first
      expect(page).to have_content(user.posts_counter)
    end

    it "show user's bio." do
      expect(page).to have_content('bio')
    end

    it "show user's first 3 posts." do
      expect(page).to have_content 'this is first post about Ruby and Rails! 1'
      expect(page).to have_content 'this is first post about Ruby and Rails! 2'
      expect(page).to have_content 'this is first post about Ruby and Rails! 3'
    end

    it "show button that lets me view all of a user's posts." do
      expect(page).to have_link('See all posts')
    end

    it "click post and redirect to that post's show page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@mohammed)
    end

    it "click see all posts and redirects to user's post's index page." do
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@mohammed)
    end
  end
end
