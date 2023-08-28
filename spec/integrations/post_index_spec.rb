require 'rails_helper'

describe 'Post Index Page Features', type: :feature, js: true do
  before :each do
    @user1 = User.create(
      name: "Ruby Guy",
      photo: "https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=987&q=80",
      bio: "I am a user1",
      posts_count: 5
    )

    post1 = Post.create(id: 4, title: 'Post 1', text: 'text 1', likes_counter: 0, comments_counter: 0,
                        author_id: @user1.id)
    post2 = Post.create(id: 5, title: 'Post 2', text: 'text 2', likes_counter: 0, comments_counter: 0,
                        author_id: @user1.id)
    Post.create(id: 6, title: 'Post 3', text: 'text 3', likes_counter: 0, comments_counter: 0, author_id: @user1.id)
    Post.create(id: 7, title: 'Post 4', text: 'text 4', likes_counter: 0, comments_counter: 0, author_id: @user1.id)
  end

  it 'can see the user\'s profile picture' do
    visit user_posts_path(@user1.id)
    expect(page).to have_css('.profile')
  end

  it 'can see the user\'s username' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('Ruby Guy')
  end

  it 'can see the number of posts the user has written' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('Number of Posts: 4')
  end

  it 'can see the post\'s title' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('Post 1')
  end

  it 'can see the post\'s body' do
    visit user_posts_path(@user1.id)
    expect(page).to have_content('text 4')
  end
end