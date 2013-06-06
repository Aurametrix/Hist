require 'spec_helper'

describe HistoriesController do

  def mock_history_entry(stubs={})
    @mock_history_entry ||= mock_model(History, stubs).as_null_object
  end
  
  before :each do
    sign_in Factory.create(:valid_user)
  end

  describe "GET index" do
    it "assigns all history_entries as @history_entries" do
      History.stub(:all) { [mock_history_entry] }
      get :index
      assigns(:history_entries).should eq([mock_history_entry])
    end
  end

  describe "GET show" do
    it "assigns the requested history_entry as @history_entry" do
      History.stub(:find).with("37") { mock_history_entry }
      get :show, :id => "37"
      assigns(:history_entry).should be(mock_history_entry)
    end
  end

  describe "GET new" do
    it "assigns a new history_entry as @history_entry" do
      History.stub(:new) { mock_history_entry }
      get :new
      assigns(:history_entry).should be(mock_history_entry)
    end
  end

  describe "GET edit" do
    it "assigns the requested history_entry as @history_entry" do
      History.stub(:find).with("37") { mock_history_entry }
      get :edit, :id => "37"
      assigns(:history_entry).should be(mock_history_entry)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created history_entry as @history_entry" do
        History.stub(:new).with({'these' => 'params'}) { mock_history_entry(:save => true) }
        post :create, :history_entry => {'these' => 'params'}
        assigns(:history_entry).should be(mock_history_entry)
      end

      it "redirects to the created history_entry" do
        History.stub(:new) { mock_history_entry(:save => true) }
        post :create, :history_entry => {}
        response.should redirect_to(history_entry_url(mock_history_entry))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved history_entry as @history_entry" do
        History.stub(:new).with({'these' => 'params'}) { mock_history_entry(:save => false) }
        post :create, :history_entry => {'these' => 'params'}
        assigns(:history_entry).should be(mock_history_entry)
      end

      it "re-renders the 'new' template" do
        History.stub(:new) { mock_history_entry(:save => false) }
        post :create, :history_entry => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested history_entry" do
        History.should_receive(:find).with("37") { mock_history_entry }
        mock_history_entry.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :history_entry => {'these' => 'params'}
      end

      it "assigns the requested history_entry as @history_entry" do
        History.stub(:find) { mock_history_entry(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:history_entry).should be(mock_history_entry)
      end

      it "redirects to the history_entry" do
        History.stub(:find) { mock_history_entry(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(history_entry_url(mock_history_entry))
      end
    end

    describe "with invalid params" do
      it "assigns the history_entry as @history_entry" do
        History.stub(:find) { mock_history_entry(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:history_entry).should be(mock_history_entry)
      end

      it "re-renders the 'edit' template" do
        History.stub(:find) { mock_history_entry(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested history_entry" do
      History.should_receive(:find).with("37") { mock_history_entry }
      mock_history_entry.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the history_entries list" do
      History.stub(:find) { mock_history_entry }
      delete :destroy, :id => "1"
      response.should redirect_to(history_entries_url)
    end
  end

end
