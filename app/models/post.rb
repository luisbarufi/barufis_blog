class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  paginates_per 50
  default_scope { order(created_at: :desc) }
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
end
