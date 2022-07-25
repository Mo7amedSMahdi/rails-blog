require 'rails_helper'

RSpec.describe 'users#index', type: :feature do
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
    end

    it 'Shows the username' do
      expect(page).to have_content('mohammed')
    end

    it "Shows the user's photo" do
      all('img').each do |i|
        expect(i[:src]).to eq('msMod.png')
      end
    end

    it 'Shows the number of posts' do
      all(:css, '.num_post').each do |post|
        expect(post).to have_content('Number of posts: 0')
      end
    end

    it "after clicking on the user, it will be redirected to that user's show page" do
      expect(page).to have_content('Number of posts: 0')
      click_on 'mohammed'
      expect(page).to have_no_content('tom')
    end
  end
end
