require_relative '../rails_helper'

RSpec.describe 'users/show.html.rb', type: :feature do
  describe 'show page' do
    before(:example) do
      @user = User.create!(
        name: 'Khan',
        photo: 'https://unsplash.com/photos/WNoLnJo7tS8',
        bio: 'Engineer',
        posts_counter: 0
      )
      @first_post = Post.create!(
        title: 'First',
        text: 'First post',
        comments_counter: 1,
        likes_counter: 1,
        author_id: @user.id
      )

      @second_post = Post.create!(
        title: 'Second',
        text: 'Second post',
        comments_counter: 1,
        likes_counter: 1,
        author_id: @user.id
      )

      @third_post = Post.create!(
        title: 'Third',
        text: 'Third post',
        comments_counter: 1,
        likes_counter: 1,
        author_id: @user.id
      )

      visit user_path(id: @user.id)
    end

    it 'dispalys the user name' do
      expect(page).to have_content(@user.name)
    end
    it 'dispalys user image' do
      expect(page).to have_css("img[src='https://unsplash.com/photos/WNoLnJo7tS8']")
    end
    it 'should render number of posts the user has written' do
      expect(page).to have_content('Number of posts: 3')
    end
    it "should render user's bio" do
      expect(page).to have_content(@user.bio)
    end
    it "should render user's first 3 posts" do
      expect(page).to have_content(@first_post.text)
      expect(page).to have_content(@second_post.text)
      expect(page).to have_content(@third_post.text)
    end
    it "should have a button to view all of a user's posts" do
      expect(page).to have_link('See all posts', href: user_posts_path(user_id: @user.id))
    end
    it 'should redirects to all posts show page.' do
      click_link 'See all posts'
      expect(page).to have_current_path(user_posts_path(user_id: @user.id))
    end
    it 'click a user post and redirects to post show page' do
      click_link @first_post.title
      expect(page).to have_current_path user_post_path(@user, @first_post)
    end
  end
end
