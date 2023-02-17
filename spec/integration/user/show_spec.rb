require 'rails_helper'

RSpec.describe 'user index', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'jimmy', photo: 'https://google.com', bio: 'am a teacher')
      @post = Post.create(author: @user, text: 'dominic', title: 'king')
      visit user_path(@user.id)
      @users = User.all
    end
    it 'should display user username' do
      expect(page).to have_content(@user.name)
    end
    it 'should display user username' do
      expect(page).to have_content(@user.bio)
    end
    it 'should display user username' do
      expect(page).to have_content(@user.post_counter)
    end
    it 'should display user username' do
      @user.posts.each do |post|
        expect(page).to have_content(post.text)
      end
    end
    it 'should display user username' do
      expect(page).to have_content('See all posts')
    end
    it 'should return each user profile picture' do
      expect("#{page.current_url}/posts/#{@post.id}").to match user_post_path(@user, @post)
    end
    it 'should return each user profile picture' do
      expect("#{page.current_url}/posts").to match user_posts_path(@user)
    end
  end
end
