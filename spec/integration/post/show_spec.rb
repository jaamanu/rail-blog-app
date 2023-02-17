require 'rails_helper'

RSpec.describe 'Posts show view', type: :system do
  describe 'Show page' do
    before(:each) do
      @user = User.create(name: 'james',
                          photo: 'https://img.freepik.com/free-psd/save-world-reusable-grocery-bag-mockup_53876-98827.jpg?', bio: 'james')
      @post = Post.create(text: 'ken', title: 'ken', author: @user)
      Comment.create(post: @post, author: @user, text: 'Amazing post Tom')
      Comment.create(post: @post, author: @user, text: 'Awesome post Tom')
      Comment.create(post: @post, author: @user, text: 'Great post Tom')
      visit user_post_path(@user.id, @post)
    end

    it 'Should have a post titkle' do
      expect(page).to have_content(@post.title)
    end

    it 'Should return the each user username' do
      expect(page).to have_content(@user.name.to_s)
    end

    it 'Should have a post titkle' do
      expect(page).to have_content(@post.comment_counter)
    end

    it 'Should have a post titkle' do
      expect(page).to have_content(@post.likes_counter)
    end

    it 'Should have a post titkle' do
      expect(page).to have_content(@post.text)
    end

    it 'Show commentor names' do
      @post.comments.each do |comment|
        expect(page).to have_content(comment.author.name)
      end
    end

    it '' do
      @post.comments.each do |comment|
        expect(page).to have_content(comment.text)
      end
    end
  end
end
