# Action when user like/unlike a micropost
class LikesController < ApplicationController
  include LikesHelper
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.like(@micropost)
    @feed_items = current_user.feed.paginate(page: params[:page])
    respond_ajax
  end

  def destroy
    @micropost = Like.find(params[:id]).liked
    current_user.unlike(@micropost)
    @feed_items = current_user.feed.paginate(page: params[:page])
    respond_ajax
  end
end
