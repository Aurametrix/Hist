class fsController < ApplicationController
  # GET /fs
  # GET /fs.xml
  def index
    @fs = F.all_by_name

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @fs }
    end
  end

  # GET /fs/1
  # GET /fs/1.xml
  def show
    @f = f.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @f }
    end
  end

  # GET /fs/new
  # GET /fs/new.xml
  def new
    @f = F.new

    #@f.ints.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @f }
    end
  end

  # GET /fs/1/edit
  def edit
    @f = f.find(params[:id])
  end

  # POST /fs
  # POST /fs.xml
  def create
    @f = f.new(params[:f])

    respond_to do |format|
      if @f.save
        format.html { redirect_to(@f, :notice => 'item was successfully created.') }
        format.xml  { render :xml => @f, :status => :created, :location => @f }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @f.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /fs/1
  # PUT /fs/1.xml
  def update
    @f = f.find(params[:id])

    respond_to do |format|
      if @f.update_attributes(params[:f])
        format.html { redirect_to(@f, :notice => 'item was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @f.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /fs/1
  # DELETE /fs/1.xml
  def destroy
    @f = f.find(params[:id])
    @f.destroy

    respond_to do |format|
      format.html { redirect_to(fs_url) }
      format.xml  { head :ok }
    end
  end
end
