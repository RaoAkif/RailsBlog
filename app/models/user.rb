class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  validates :name, presence: true
  validates :post_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_initialize :default_values

  def last_3_posts
    posts.order(created_at: :desc).limit(3)
  end

  private

  def default_values
    self.posts_counter ||= 0
  end
end