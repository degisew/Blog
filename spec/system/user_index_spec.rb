require 'rails_helper'
describe User, type: :system do
  before :all do
    @first_user = User.create(name: 'Dagi',
                              photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                              bio: 'A software developer from Ethiopia',
                              posts_counter: 3)
    @second_user = User.create(name: 'Meshu',
                               photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
                               bio: 'Teacher from Woldia',
                               posts_counter: 1)
  end
  it 'Should have user name meshu name Dagi' do
    visit users_path
    expect(page).to have_text('Dagi')
    expect(page).to have_content('Meshu')
  end
  it 'I can see the users profile picture' do
    visit user_path(@first_user)
    expect(page).to have_css('img', count: 1)
  end
  it 'should be able to see users profile picture' do
    visit("users/#{@first_user.id}")
    expect(page).to have_css('img', count: 1)
    visit("users/#{@second_user.id}")
    expect(page).to have_css('img', count: 1)
  end
  it 'I can see the number of posts each user has written.' do
    visit users_path(@first_user)
    expect(page).to have_content('Number of Posts:3')
  end
end
