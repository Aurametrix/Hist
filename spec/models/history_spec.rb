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
  
  it "should have quantities" do
    History.create(:note => "first recorded event", :user => @user1, :disease => @IBS, :onset_at => Time.now, :severity => 1)
    
    History.where(:quantities => 2).should have(1).entries
  end
  
end
