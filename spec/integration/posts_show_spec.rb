require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  describe 'Post' do
    before(:each) do
      @first_user = User.first!
      @second_user = User.second!

      @first_post = Post.first!
      @second_post = Post.second!
      @third_post = Post.third!
      @fourth_post = Post.fourth!
      @comment1 = Comment.first!
      @comment2 = Comment.second!

      # @first_user = User.create(name: 'Tom', photo: 'margaret.jpeg', bio: 'Teacher from Mexico.', posts_counter: 0)
      # @first_user.save!
      # @second_user = User.create(name: 'Lilly', photo: 'margaret.jpeg', bio: 'Teacher from Poland.', posts_counter: 0)
      # @second_user.save!
      # visit root_path
      #
      # @first_post = Post.create(author: @first_user, title: 'Hello', text: 'This is my first post',
      #                           comments_counter: 0, likes_counter: 0)
      # @second_post = Post.create(author: @first_user, title: 'Hello, again', text: 'This is my second post',
      #                            comments_counter: 0, likes_counter: 0)
      # @third_post = Post.create(author: @second_user, title: 'Hello', text: 'This is my first post',
      #                           comments_counter: 0, likes_counter: 0)
      # @fourth_post = Post.create(author: @second_user, title: 'Hello, again', text: 'This is my second post',
      #                            comments_counter: 0, likes_counter: 0)
      #
      # @comment1 = Comment.create(post: Post.first, author: User.first, text: 'Hi Tom!')
      # @comment2 = Comment.create(post: Post.first, author: User.first, text: 'Hi Tom Again!')
      # @comment3 = Comment.create(post: Post.first, author: User.first, text: 'Hi Tom Again twice!')

      visit user_post_path(@first_user, @first_post)
    end

    it 'shows the person who wrote the post' do
      expect(page).to have_content('By mohammed')
    end

    it 'shows number of comments' do
      post = Post.first
      expect(page).to have_content(post.comments_counter)
    end

    it 'shows number of likes' do
      post = Post.first
      expect(page).to have_content(post.likes_counter)
    end

    it 'can see the post\'s body.' do
      expect(page).to have_content('this is first post about Ruby and Rails! 1')
    end

    it 'can see the username of each commentor.' do
      post = Post.first
      comment = post.comment.first
      expect(page).to have_content(comment.author.name)
    end

    it 'can see the comments of each commentor.' do
      expect(page).to have_content 'really nice post Michael'
      expect(page).to have_content 'Absolutely amazing 1'
      expect(page).to have_content 'Absolutely amazing 2'
      expect(page).to have_content 'Absolutely amazing 3'
      expect(page).to have_content 'Absolutely amazing 4'
    end
  end
end
