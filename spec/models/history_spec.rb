require 'spec_helper'

describe History do
  
  before :each do
    @user1 = Factory.create(:valid_user)
    @user2 = Factory.create(:another_valid_user)
  end
