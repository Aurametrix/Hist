require 'spec_helper'

describe fsController do

  def mock_F(stubs={})
    @mock_f ||= mock_model(F, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all fs as @fs" do
      F.stub(:all_by_name) { [mock_f] }
      get :index
      assigns(:fs).should eq([mock_f])
    end
  end

  describe "GET show" do
    it "assigns the requested F as @f∑" do
      F.stub(:find).with("37") { mock_f }
      get :show, :id => "37"
      assigns(:f).should be(mock_f)
    end
  end

  describe "GET new" do
    it "assigns a new f as @f" do
      F.stub(:new) { mock_food }
      get :new
      assigns(:F).should be(mock_F)
    end
  end

  describe "GET edit" do
    it "assigns the requested F as @F" do
      F.stub(:find).with("37") { mock_F }
      get :edit, :id => "37"
      assigns(:F).should be(mock_F)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created F as @F" do
        F.stub(:new).with({'these' => 'params'}) { mock_F(:save => true) }
        post :create, :F => {'these' => 'params'}
        assigns(:F).should be(mock_F)
      end

      it "redirects to the created F" do
        F.stub(:new) { mock_F(:save => true) }
        post :create, :F => {}
        response.should redirect_to(F_url(mock_F))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved F as @F" do
        F.stub(:new).with({'these' => 'params'}) { mock_F(:save => false) }
        post :create, :F => {'these' => 'params'}
        assigns(:F).should be(mock_F)
      end

      it "re-renders the 'new' template" do
        F.stub(:new) { mock_F(:save => false) }
        post :create, :F => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested F" do
        F.should_receive(:find).with("37") { mock_F }
        mock_F.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :F => {'these' => 'params'}
      end

      it "assigns the requested F as @F" do
        F.stub(:find) { mock_F(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:F).should be(mock_F)
      end

      it "redirects to the F" do
        F.stub(:find) { mock_F(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(F_url(mock_F))
      end
    end

    describe "with invalid params" do
      it "assigns the F as @F" do
        F.stub(:find) { mock_F(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:F).should be(mock_F)
      end

      it "re-renders the 'edit' template" do
        F.stub(:find) { mock_F(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested F" do
      F.should_receive(:find).with("37") { mock_F }
      mock_F.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fs list" do
      F.stub(:find) { mock_F }
      delete :destroy, :id => "1"
      response.should redirect_to(fs_url)
    end
  end

end
