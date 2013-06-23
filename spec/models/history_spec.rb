require 'spec_helper'

describe History do
  
  before :each do
    @user1 = Factory.create(:valid_user)
    @user2 = Factory.create(:another_valid_user)
  end

it "should require events" do
    History.new(:note => "something happened", :user => @patient, :action => @exposure).valid?.should be_true
    History.new(:note => "something didn't happen", :user => @patient, :action => nil).valid?.should be_false
  end
  
  it "should require user" do
    DiaryEntry.new(:note => "test entry", :food => @apple, :user => @user2).valid?.should be_true
    DiaryEntry.new(:note => "test 2 entry", :food => @apple, :user => nil).valid?.should be_false
  end
  
it "should find by user" do
    History.create(:note => "so it was", :user => @user1, :f => @war)
    History.create(:note => "another party's problem", :user => @user2, :f => @fire)
    History.create(:note => "first party's problem", :user => @user1, :f => @famine)
    
    History.all.should have(3).entries
    History.all_by_user(@user1).should have(2).entries
  end
  
  it "should order by happened at time" do
    History.create(:note => "first entry", :user => @user1, :f => @war, :happened_at => Time.now)
    History.create(:note => "second entry", :user => @user1, :f => @fire, :happened_at => Time.now + 55555)
    
    entries = History.order_by_happened_at
    entries.should have(2).entries
    
    entries.first.note.should eq("second entry")
  end

  it "should have quantities" do
    History.create(:note => "first recorded event", :user => @user1, :disease => @IBS, :onset_at => Time.now, :severity => 1)
    
    History.where(:quantities => 2).should have(1).entries
  end

  it "should initially set time of the event to the time of creation" do
    entry = History.create(:note => "happened at time", :user => @user1, :catastrophe => @fainting, :quatntities => 5)
    
    entry.happened_at.should_not be_nil
  end

  
end
