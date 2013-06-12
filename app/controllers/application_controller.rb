class ApplicationController < ActionController::Base
  protect_from_forgery

  after_filter :discard_flash_if_xhr
  
  protected
    def discard_flash_if_xhr
      flash.discard if request.xhr?
    end
    

end

