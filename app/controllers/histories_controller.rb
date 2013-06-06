class HistoriesController < ApplicationController
  before_filter :authenticate_user!

  # GET /histories
  # GET /histories.xml
  def index
    @histories = History.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @histories }
    end
  end

  # GET /histories/1
  # GET /histories/1.xml
  def show
    @history = History.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @diary_entry }
    end
  end

  # GET /histories/new
  # GET /histories/new.xml
  def new
    @history = History.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @history }
    end
  end

  # GET /histories/1/edit
  def edit
    @history = History.find(params[:id])
  end

  # POST /histories
  # POST /histories.xml
  def create
    @diary_entry = History.new(params[:diary_entry])

    respond_to do |format|
      if @history.save
        format.html { redirect_to(@history, :notice => 'Diary entry was successfully created.') }
        format.xml  { render :xml => @history, :status => :created, :location => @diary_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /histories/1
  # PUT /histories/1.xml
  def update
    @diary_entry = History.find(params[:id])

    respond_to do |format|
      if @history.update_attributes(params[:diary_entry])
        format.html { redirect_to(@history, :notice => 'History was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @history.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /histories/1
  # DELETE /histories/1.xml
  def destroy
    @history = History.find(params[:id])
    @history.destroy

    respond_to do |format|
      format.html { redirect_to(histories_url) }
      format.xml  { head :ok }
    end
  end
end
