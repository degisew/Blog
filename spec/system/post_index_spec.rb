require 'rails_helper'

describe Post, type: :feature do
  before :all do
    @first_user = User.create(
      name: 'Alexo',
      photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      bio: 'Instructor from skillmart college',
      posts_counter: 3
    )
    @second_user = User.create(
      name: 'Abela',
      photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      bio: 'Caratist from colombia',
      posts_counter: 0
    )

    @first_post = Post.create(title: 'First Post', text: 'How to increase productivity using RubyMine IDE?',
                              comments_counter: 0, likes_counter: 0, author: @second_user)

    @first_comment = Comment.create(text: 'Here is my comment', author: @second_user, post: @first_post)
  end

  it 'should  have an image' do
    visit("users/#{@first_user.id}/posts")
    expect(page).to have_css('img', count: 1)
  end
  it 'should have a username' do
    visit("users/#{@second_user.id}/posts")

    expect(page).to have_content @first_post.author.name
  end
  it 'Should be able to see the number of posts the user has written' do
    visit("users/#{@second_user.id}/posts")
    expect(page).to have_content 'Number of Posts:0'
    visit("users/#{@first_user.id}/posts")
    expect(page).to have_content 'Number of Posts:3'
  end
  it 'should have the post title' do
    visit("users/#{@second_user.id}/posts")

    expect(page).to have_content(@first_post.title)
  end

  it 'should have the post body' do
    visit("users/#{@second_user.id}/posts")

    expect(page).to have_content @first_post.text
  end
  it 'should have comment number' do
    visit("users/#{@second_user.id}/posts")

    expect(page).to have_content "Comments: #{@first_post.comments_counter}"
  end

  it 'should have number of likes' do
    visit("users/#{@second_user.id}/posts")

    expect(page).to have_content "Likes: #{@first_post.likes_counter}"
  end
end
