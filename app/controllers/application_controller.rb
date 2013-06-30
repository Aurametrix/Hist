class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :discard_flash_if_xhr
  
  def admin_required
    if current_user.nil? or (not current_user.admin?)
      redirect_to "/unauthorized" 
      return
    end
  end

  protected
    def discard_flash_if_xhr
      flash.discard if request.xhr?
    end
    

end

