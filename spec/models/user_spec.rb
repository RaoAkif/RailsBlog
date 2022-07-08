require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    @user.save
  end

  describe 'User Model Properties' do
    it 'Name must not be blank' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'PostsCounter must be an integer greater than or equal to zero' do
      @user.posts_counter = -1
      expect(@user).to_not be_valid
    end

    it 'PostsCounter must always be integer' do
      @user.posts_counter = 1.1
      expect(@user).to_not be_valid
    end
  end

  it 'should have a last_3_posts method' do
    expect(@user).to respond_to(:last_3_posts)
  end
end
