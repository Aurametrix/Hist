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
