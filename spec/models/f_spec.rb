require 'spec_helper'

describe F do
  describe "name starts with" do
    before :each do
      F.create(:name => "apple", :type => "fruit")
      F.create(:name => "running", :type => "activity")
      F.create(:name => "nausea", :type => "symptom")
    end
    
    it "should find items that start form app" do
      fs = F.name_starts_with("app")
      
      fs.should have(1).entries
    end
    
    it "should find all records that start with a" do
      fs = F.name_starts_with("a")
      
      fs.should have(2).entries
    end
    
    it "should find no records" do
      fs = F.name_starts_with("unknown")
      
      fs.should have(0).entries
    end
    
    it "should return all records when given empty string" do
      fs = F.name_starts_with("")
      
      fs.should have(3).entries
    end
    
    it "should be case insensitive" do
      foods = F.name_starts_with("Ap")
      
      fs.should have(2).entries
    end
  end
end
