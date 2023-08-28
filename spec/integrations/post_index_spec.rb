require 'rails_helper'

describe 'Post Index Page Features', type: :feature, js: true do
  before :each do
    @user1 = User.create(
      name: "Ruby Guy",
      photo: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
      bio: "I am a user1",
      posts_count: 5
    )
  end

  it 'can see the user\'s profile picture' do
    visit user_posts_path(@user1.id)
    expect(page).to have_css('.profile')
  end

  it 'can see the user\'s username' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('Ruby Guy')
  end
end