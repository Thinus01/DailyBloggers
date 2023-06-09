require 'rails_helper'

RSpec.describe 'UsersIndex', type: :feature do
  describe 'user index test' do
    before(:each) do
      @user = User.create!(name: 'User', photo: 'https://unsplash.com/photos/WNoLnJo7tS8', posts_counter: 3,
                           bio: 'I am a user')
      @user2 = User.create!(name: 'User2', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user3 = User.create!(name: 'User3', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user4 = User.create!(name: 'User4', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
      @user5 = User.create!(name: 'User5', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', posts_counter: 3,
                            bio: 'I am a user')
    end

    it 'Shows the username of each user' do
      visit users_path
      expect(page).to have_content(@user.name)
      expect(page).to have_content(@user2.name)
      expect(page).to have_content(@user3.name)
      expect(page).to have_content(@user4.name)
      expect(page).to have_content(@user5.name)
    end
    it 'dispalys user image' do
      visit users_path
      expect(page).to have_css("img[src='https://unsplash.com/photos/WNoLnJo7tS8']")
    end
    it 'Shows the number of posts each user has' do
      visit users_path
      expect(page).to have_content(@user.posts_counter)
      expect(page).to have_content(@user2.posts_counter)
      expect(page).to have_content(@user3.posts_counter)
      expect(page).to have_content(@user4.posts_counter)
      expect(page).to have_content(@user5.posts_counter)
    end
    it 'Shows the link to each user' do
      visit users_path
      expect(page).to have_link(@user.name, href: user_path(@user))
      expect(page).to have_link(@user2.name, href: user_path(@user2))
      expect(page).to have_link(@user3.name, href: user_path(@user3))
      expect(page).to have_link(@user4.name, href: user_path(@user4))
      expect(page).to have_link(@user5.name, href: user_path(@user5))
    end
  end
end
