require 'rails_helper'
describe User, type: :system do
  before :each do
    @user1 = User.create(name: 'Enate',
                         photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                         bio: 'Enate is a merchant and a mother of four.',
                         posts_counter: 3)
  end
  it 'Should have user name Enate' do
    visit user_path(@user1)

    expect(page).to have_text('Enate')
  end
  it 'Should be able to see the number of posts Ema has written.' do
    visit user_path(@user1)

    Post.create(author: @user1, title: 'Introduction to rails', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user1, title: 'Introduction to testing', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user1, title: 'Introduction to Capybara', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    expect(page).to have_content('Number of Posts:3')
  end
  it 'should be able to see the users first 3 posts.' do
    Post.create(author: @user1, title: 'Introduction to Rspec', text: 'Rails is a web', comments_counter: 0,
                likes_counter: 0)
    Post.create(author: @user1, title: 'System testing using capybara with rspec',
                text: 'Rails is a web', comments_counter: 0, likes_counter: 0)
    visit user_path(@user1)

    expect(page).to have_content('Introduction to Rspec')
    expect(page).to have_content('System testing using capybara with rspec')
  end
  it 'Should be able to see the users profile picture' do
    visit user_path(@user1)
    expect(page).to have_css('img', count: 1)
  end
end
