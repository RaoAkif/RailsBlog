require 'rails_helper'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.', posts_counter: 0)
    @user.save
    @post = Post.new(author: @user, title: 'Post 1', text: 'text 1', comments_counter: 0, likes_counter: 0)
    @post.save
  end

  describe 'Post Model Properties' do
    it 'Title must not be blank' do
      @post.title = nil
      expect(@post).to_not be_valid
    end

    it 'Title must not exceed 250 characters' do
      @post.title = 'a' * 251
      expect(@post).to_not be_valid
    end

    it 'CommentsCounter must be an integer greater than or equal to zero' do
      @post.comments_counter = -1
      expect(@post).to_not be_valid
    end

    it 'LikesCounter must be an integer greater than or equal to zero' do
      @post.likes_counter = -1
      expect(@post).to_not be_valid
    end
  end

  describe 'Post Model Methods' do
    it 'should have a last_5_comments method' do
      expect(@post).to respond_to(:last_5_comments)
    end
  end
end
