# Micropost action, for example: create, destroy...
class MicropostsController < ApplicationController
  include MicropostsHelper
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @feed_items = current_user.feed.paginate(page: params[:page])
    micropost_render_ajax_when_create @micropost
  end

  def destroy
    @micropost.destroy
    @feed_items = current_user.feed.paginate(page: params[:page])
    destroy_micropost_in_profile_link @micropost
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url if @micropost.nil?
  end
end
