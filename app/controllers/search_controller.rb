class SearchController < ApplicationController
  
  def index
    @fs = F.name_starts_with(params["query"])
    render :json => @fs
  end

end
