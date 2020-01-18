class DislikesController < ApplicationController
  before_action :find_post
  before_action :find_dislike, only: [:destroy]

  def create
    Dislike.create(user: current_user, post: @post)
    redirect_to post_path(@post)
  end

  def destroy
    # if !(already_disliked?)
    #   flash[:notice] = "Cannot unlike"
    # else
    #   @dislike.destroy
    # end
    @dislike.destroy
    redirect_to post_path(@post)
  end

private

  # def already_disliked?
  #   Dislike.where(user_id: current_user.id, post_id:
  #   params[:post_id]).exists?
  # end

  def find_dislike
    @dislike = @post.dislikes.find(params[:id])
  end

  def find_post
    @post = Post.find(params[:post_id])
  end
end
