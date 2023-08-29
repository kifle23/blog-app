require 'rails_helper'

describe 'User Index Page Features', type: :feature, js: true do
  before :each do
    @user1 = User.create(
      name: 'Ruby Guy',
      photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80',
      bio: 'I am a user1',
      posts_count: 5
    )
  end

  it 'can see the username of all other users' do
    visit users_path
    expect(page).to have_all_of_selectors('.user-name')
  end

  it 'can see the profile pic of each users' do
    visit users_path
    expect(page).to have_all_of_selectors('.profile')
  end

  it 'can see the number of posts each user has written' do
    visit users_path
    expect(page).to have_all_of_selectors('.number-of-posts')
  end

  it 'redirect to the user\'s show page' do
    visit users_path
    click_link(href: user_path(@user1.id))
    expect(page).to have_current_path(user_path(@user1.id))
  end
end
