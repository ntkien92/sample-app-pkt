# Action when user like/unlike a micropost
class LikesController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.like(@micropost)
    redirect_to :back
  end

  def destroy
    @micropost = Like.find(params[:id]).liked
    current_user.unlike(@micropost)
    redirect_to :back
  end
end
