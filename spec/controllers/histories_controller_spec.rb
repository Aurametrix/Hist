require 'spec_helper'

describe HistoriesController do

  def mock_history(stubs={})
    @mock_history ||= mock_model(History, stubs).as_null_object
  end
  
  before :each do
    sign_in Factory.create(:valid_user)
  end

  describe "GET index" do
    it "assigns all historries as @histories" do
      History.stub(:all_by_user) { mock(History, {:order_by_date => [mock_history]}) }
      get :index
      assigns(:histories).should eq([mock_history])
    end
  end

  describe "GET show" do
    it "assigns the requested history as @history" do
      History.stub(:find).with("37") { mock_history }
      get :show, :id => "37"
      assigns(:history).should be(mock_history)
    end
  end

  describe "GET new" do
    it "assigns a new history as @history" do
      History.stub(:new) { mock_history }
      get :new
      assigns(:history).should be(mock_history)
    end
  end

  describe "GET edit" do
    it "assigns the requested history as @history" do
      History.stub(:find).with("37") { mock_history }
      get :edit, :id => "37"
      assigns(:history).should be(mock_history)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created history as @history" do
        History.stub(:new).with({'these' => 'params'}) { mock_history(:save => true) }
        post :create, :history => {'these' => 'params'}
        assigns(:history).should be(mock_history)
      end

      it "redirects to the created history" do
        History.stub(:new) { mock_history(:save => true) }
        post :create, :history => {}
        response.should redirect_to(history_url(mock_history))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved history as @history" do
        History.stub(:new).with({'these' => 'params'}) { mock_history(:save => false) }
        post :create, :history => {'these' => 'params'}
        assigns(:history).should be(mock_history)
      end

      it "re-renders the 'new' template" do
        History.stub(:new) { mock_history(:save => false) }
        post :create, :history => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested history" do
        History.should_receive(:find).with("37") { mock_history }
        mock_history.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :history => {'these' => 'params'}
      end

      it "assigns the requested history as @history" do
        History.stub(:find) { mock_history(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:history).should be(mock_history)
      end

      it "redirects to the history" do
        History.stub(:find) { mock_history(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(historical_entries_url)
      end
    end

    describe "with invalid params" do
      it "assigns the history as @history" do
        History.stub(:find) { mock_history(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:history).should be(mock_history)
      end

      it "re-renders the 'edit' template" do
        History.stub(:find) { mock_history(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested history" do
      History.should_receive(:find).with("37") { mock_history }
      mock_history.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the historical_entries list" do
      History.stub(:find) { mock_history }
      delete :destroy, :id => "1"
      response.should redirect_to(historical_entries_url)
    end
  end

end
