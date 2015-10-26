# LikesHelper
module LikesHelper
  def respond_ajax
    respond_to do |format|
      format.html { redirect_to :back }
      format.js
    end
  end
end
