  def index
    respond_to do |format|
      format.html {render :text => "html"}
      
      format.js  do
        @fs = F.name_starts_with(params["query"])
        render :json => @fs.to_json(:methods => :category)
      end
      
    end
    
  end

end
