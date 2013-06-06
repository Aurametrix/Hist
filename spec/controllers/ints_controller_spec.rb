require 'spec_helper'

describe IntsController do

  describe "GET 'new'" do
    it "should be successful" do
      get 'new.js'
      response.should be_success
    end
  end

end
