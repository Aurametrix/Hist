require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the HistoriesHelper. For example:
#
# describe HistoriesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe HistoriesHelper do
  describe "hours of the day" do
    
    it "should have 24 entries" do
      hours = helper.hours_of_the_day
    
      hours.should have(24).entries
    end
  
    it "should have 12:00 am as first element" do
      hours = helper.hours_of_the_day
      hours[0][0].should eq "12:00 am"
      hours[0][1].should eq "00"
    end
  end

  describe "display action taken for entry" do
    before :each do
      @user = Factory.create(:valid_user)
      @food = Factory.create(:f, :action => Factory(:happened_action)) 
      @entry = History.new(:note => "test event", :f => @f, :user => @user, :happened_at => Time.parse("2013-06-27 13:00:00"))
    end
    
    it "should show singular form when quantity is 1.0" do
      @entry.quantities = 1.0
      
      helper.display_action_taken_for(@entry).should eq "happened 1 times around 1 PM on June 27, 2013"
    end
    
    it "should show plural form when serving is 0.5" do
      @entry.servings = 0.5
      
      helper.display_action_taken_for(@entry).should eq "ate 0.5 servings around 1 PM on June 27, 2013"
    end
  end


describe "datetime in words" do
    it "should display 9 AM on September 12, 2010" do
      t = Time.parse("2010-09-12 09:00:00")
    
      helper.datetime_in_word(t).should eq "9 AM on September 12, 2010"
    end
  
    it "should display 12 AM on September 20, 2010" do
      t = Time.parse("2010-09-20 00:00:00")
    
      helper.datetime_in_word(t).should eq "12 AM on September 20, 2010"
    end
    
    it "should display 11 PM on September 20, 2010" do
      t = Time.parse("2010-09-20 23:00:00")
    
      helper.datetime_in_word(t).should eq "11 PM on September 20, 2010"
    end
  end

end
