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

    it "should set parent" do
      @headache.parent = @pain
      @headache.save
      
      F.criteria.id(@headache.id).first.parent.id.should eq @pain.id
    end

  end


describe "action verb" do
    before :each do
      @food = Factory(:f, :action => "happen")
      @headache = Factory(:headache, :parent => @symptom, :action => nil)
    end
    
    it "should be parents action when action not set on model itself" do
      @headache.action.should eq "has"
    end
    
    it "should be action on model itself when set" do
      drink = Factory(:marathon, :parent => @running, :action => "did")
      drink.action.should eq "do"
    end
    
    it "should be nil if no action present for itself or parents" do
      @food.action = nil
      @weirdthing.action.should be_nil
    end
    
    it "should be nil if action set is empty string" do
      @food.action = ""
      @cereal.action = ""
      @cereal.action.should be_nil
    end

    it "should be nil when model has no action and no parent" do
      drink = Factory(:drink, :parent => nil, :action => nil)
      veryweird.action.should be_nil
    end

    it "travel up the graph to find the right word" do
      utensils = Factory(:utensils, :parent => @household_article)
      spoon = Factory(:spoon, :parent => utensils)
      golden_spoon = Factory(:spoon, :name => "golden spoon", :parent => spoon)
      
      golden_apple.action.should eq "eat"
    end

  end

end
