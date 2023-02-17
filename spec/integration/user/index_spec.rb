require 'rails_helper'

RSpec.describe 'user index', type: :system do
  describe 'index page' do
    before(:each) do
      @user = User.create(name: 'jimmy', photo: 'https://google.com', bio: 'am a teacher')
      visit users_path
      @users = User.all
    end
    it 'should return each user profile picture' do
      @users.each do |pic|
        expect(page).to have_css("img[src*='#{pic.photo}']")
      end
    end
    it 'should return each user profile picture' do
      @users.each do |pic|
        expect(page).to have_content(pic.name)
      end
    end
    it 'should return each user profile picture' do
      @users.each do |pic|
        expect(page).to have_content(pic.post_counter)
      end
    end
    it 'should return each user profile picture' do
      expect("#{page.current_url}/#{@user.id}").to match users_path(@user.id)
    end
  end
end
