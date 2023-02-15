require 'rails_helper'

describe Post, type: :feature do
  before :each do
    @first_user = User.create(
      name: 'John',
      photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      bio: 'Here my story',
      posts_counter: 3
    )
    @second_user = User.create(
      name: 'meshu',
      photo: 'https://images.unsplash.com/photo-1661956602116-aa6865609028?ixlib=rb-4.0.3&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwxfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      bio: 'Here my story',
      posts_counter: 0
    )

    @post1 = Post.create(
      title: 'First Post',
      text: 'Here is my post',
      comments_counter: 0,
      likes_counter: 0,
      author: @second_user
    )

    @comment = Comment.create(
      text: 'Here is my comment',
      author: @second_user,
      post: @post1
    )

    visit(user_post_path(@second_user, @post1))
  end
  it 'should have the post\'s comments count' do
    expect(page).to have_content('Comments: 0')
  end

  it 'should have the post\'s likes count' do
    expect(page).to have_content('Likes: 0')
  end
  it 'should have the post title' do
    expect(page).to have_content(@post1.comments.name)
  end

  it 'should have the post\'s author' do
    expect(page).to have_content(@post1.author.name)
  end
  it 'should have the commentor comment he left' do
    expect(page).to have_content @comment.text
  end
end
