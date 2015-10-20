# MicropostsHelper
module MicropostsHelper
  def destroy_micropost_in_profile_link(micropost)
    @micropost = micropost
    @user = User.find(@micropost.user.id)
    @microposts = @micropost.user.microposts.paginate(page: params[:page])
  end

  def micropost_render_ajax_when_create(micropost)
    @micropost = micropost
    if @micropost.save
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
end
