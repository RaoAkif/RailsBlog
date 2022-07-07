class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  after_save :increment_user_comments_count

  private

  def increment_user_comments_count
    post.increment!(:comments_counter)
  end
end
