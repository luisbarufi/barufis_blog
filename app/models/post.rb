class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  paginates_per 50
end
