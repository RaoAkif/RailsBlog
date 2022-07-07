class Like < ApplicationRecord
  belongs_to :user, foreign_key: :author_id
  belongs_to :post

  after_save :increment_post_likes_count

  private

  def increment_post_likes_count
    post.increment!(:likes_counter)
  end
end