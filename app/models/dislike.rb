class Dislike < ApplicationRecord
  belongs_to :post
  belongs_to :user

  # Protegido via index composto unico... (ver migration AddUniqueLikeDislike)
  # validates_uniqueness_of :post, scope: [:post_id, :user_id]

  after_create :remove_like

  def remove_like
    Like.where(user: self.user, post: self.post).destroy_all
  end

end
