require 'spec_helper'

describe SearchController do

  describe "GET 'index' json" do
    before :each do
      @personal = Factory(:personal)
      @toothpaste = Factory(:toothpaste, :parent => @personal)
    end
    
    it "should contain category" do  
      Food.should_receive(:name_starts_with).with("toothpaste").and_return([@toothpaste])
      
      xhr(:get, :index, {'query' => 'toothpaste'})
      
      response.should be_success
      
      fs = JSON.parse(response.body)

      fs.size.should eq(1)
      fs[0]["category"].should eq "f"
    end
  end
end
