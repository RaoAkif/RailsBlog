require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    @user.save
    @post = Post.new(author: @user, title: 'Post 1', text: 'text 1', comments_counter: 0, likes_counter: 0)
    @post.save
    @comment = Comment.new(post: @post, author: @user, text: 'text 1')
    @comment.save
  end

  describe 'Comment Model Properties' do
    it 'author should be present' do
      @comment.author = nil
      expect(@comment).to_not be_valid
    end

    it 'post should exist' do
      @comment.post = nil
      expect(@comment).to_not be_valid
    end
  end
end
