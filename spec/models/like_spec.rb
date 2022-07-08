require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = @user = User.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                             posts_counter: 0)
    @user.save
    @post = Post.new(author: @user, title: 'Post 1', text: 'text 1', comments_counter: 0, likes_counter: 0)
    @post.save
    @comment = Comment.new(post: @post, author: @user, text: 'text 1')
    @comment.save
  end

  describe 'Like Model Properties' do
    it 'author_id should be present' do
      @like = Like.new(author: @user, post: @post)
      expect(@like).to be_valid
    end

    it 'post_id should be present' do
      @like = Like.new(author: @user, post: @post)
      expect(@like).to be_valid
    end
  end
end
