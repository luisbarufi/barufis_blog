class Comment < ApplicationRecord
  belongs_to :post
  validates :body, presence: true, length: { minimum: 5 }
  validates :commenter, presence: true, length: { minimum: 2 }
end
