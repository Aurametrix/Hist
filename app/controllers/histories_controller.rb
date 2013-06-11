class HistoriesController < ApplicationController
  before_filter :authenticate_user!

  before_filter :valid_f_id, :only => :create_from_query

  # GET /histories
  # GET /histories.xml
  def index
    @histories = History.all_by_user(current_user).order_by_date

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
      format.xml  { render :xml => @history }
    end
  end

  # GET /histories/new
  # GET /histories/new.xml
  def new
    @history = History.new
    @f = F.all[2]
    @history - History.new(:f => @f)

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @history }
    end
  end

  # GET /histories/1/edit
  def edit
    @history = History.find(params[:id])
  end

  def create_from_query
    f = F.criteria.id(params[:query_f_id]).first
    @history = History.new(:food => food, :user => current_user)
    
    respond_to do |format|
      if @history.save
        flash[:notice] = "Historical entry created"
        format.js {render :action => "edit", :layout => false}
        format.html { redirect_to(:action => "index", :edit => true) }
      else
        format.js { render :nothing => true }
        format.html {redirect_to(:action => "index", :notice => 'Error creating diary entry')}
      end
    end
  end


  # POST /histories
  # POST /histories.xml
  def create
    @history = History.new(params[:history])
    @history.user = current_user

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
        flash[:notice] = "Historical entry was successfully updated."
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

  private
    def valid_f_id
      if params[:query_f_id].blank?
        flash[:alert] = "Invalid entry, please select from drop down"
        redirect_to :action => "index"
      end
    end
 end
