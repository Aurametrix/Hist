  def index
    @fs = F.name_starts_with(params["query"])
    render :json => @fs
  end

end
class SearchController < ApplicationController
  
  def index
    respond_to do |format|
      format.html
      
      format.js  do
        @fs = F.name_starts_with(params["query"])
        render :json => @fs
      end
      
    end
    
  end

end
