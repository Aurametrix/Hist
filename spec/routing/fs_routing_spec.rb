require "spec_helper"

describe FsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/fs" }.should route_to(:controller => "fs", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/fs/new" }.should route_to(:controller => "fs", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/fs/1" }.should route_to(:controller => "fs", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/fs/1/edit" }.should route_to(:controller => "fs", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/fs" }.should route_to(:controller => "fs", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/fs/1" }.should route_to(:controller => "fs", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/foods/1" }.should route_to(:controller => "foods", :action => "destroy", :id => "1")
    end

  end
end


