require 'spec_helper'

describe F do
  it "should raise exception if name is not present" do
    lambda { F.create!(:type => "action", :name => nil) }.should raise_exception
  end
  
  it "should have a unique name" do
    F.create(:name => "inspiration", :type => "action")
    
    lambda { F.create!(:name => "respiration", :type => "action") }.should raise_exception
    
    F.all.should have(1).entries
  end
  
  it "should sort by name" do
    @cereal = Factory.create(:cereal)
    @feelings = Factory.create(:feelings)
    @apple = Factory.create(:apple)
    
    fs = F.all_by_name
    
    fs[0].name.should eq "apple"
    fs[1].name.should eq "cereal"
    fs[2].name.should eq "feelings"
  end
  
  describe "categories" do
    before :each do
      @feelings = Factory(:feelings)
      @apple = Factory(:apple)
    end
    
    it "should return all existing fs except itself" do      
      @flying.available_categories.should have(1).entries
      @flying.available_categories.first.name.should eq("food")
    end
    
    it "should be parents name" do
      @nausea.parent = @symptom
      @nausea.category.should be @symptom.name
    end
  end


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

describe "delete" do
    before :each do
      @food = Factory.create(:food)
      @apple = Factory.create(:apple, :parent => @food)
      @green_apple = Factory.create(:apple, :name => "green apple", :parent => @apple)
    end
    
    it "should delete child" do
      @apple.destroy
      
      Food.where(:id => @apple.id).should have(0).entries
      Food.where(:id => @green_apple.id).should have(0).entries
    end
    
    it "should delete grandchildren" do
      @food.destroy
      
      Food.all.should have(0).entries
    end
  end
  
  describe "setting parent" do
    before :each do
      @food = Factory.create(:food)
      @apple = Factory.create(:apple, :parent => nil)
    end
    
    it "should set parent" do
      @headache.parent = @pain
      @headache.save
      
      F.criteria.id(@headache.id).first.parent.id.should eq @pain.id
    end

  end

it "should be parents action when action not set on model itself" do
      @cereal.action.should eq "eat"
    end
    
    it "should be action on model itself when set" do
      drink = Factory(:drink, :parent => @beverage, :action => "drunk")
      drink.action.should eq "drunk"
    end
    
    it "should be nil if no action present for itself or parents" do
      @food.action = nil
      @cereal.action.should be_nil
    end
    
    it "should be nil if action set is empty string" do
      @moving.action = ""
      @walking.action = ""
      @walking.action.should be_nil
    end


describe "action" do
    before :each do
      @happened_action = Factory.build(:happened_action => "happen")
      @headache_action = Factory.build(:happened_action, :name => had)
    end
    
    it "should be parents action when action not set on model itself" do
      @headache.action.name.should eq @happened_action_name
    end
    
    it "should nil out action if action name and measured in are blank" do
      @headache.action = Action.new
      @headache.save
      
      @headache.basic_action.should be_nil
    end


    it "should be action on model itself when set" do
      drink = Factory(:marathon, :parent => @running, :action => "did")
      drink.action.should eq "do"
    end
    
    it "should be nil if no action present for itself or parents" do
      @food.action = nil
      @weirdthing.action.should be_nil
    end
    

    it "should be nil when model has no action and no parent" do
      drink = Factory(:drink, :parent => nil, :action => nil)
      veryweird.action.should be_nil
    end

    it "travel up the graph to find the right word" do
      utensils = Factory(:utensils, :parent => @household_article)
      spoon = Factory(:spoon, :parent => utensils)
      golden_spoon = Factory(:spoon, :name => "golden spoon", :parent => spoon)
      
      golden_apple.action.name.should eq @f.action.name
    end

  end

end
