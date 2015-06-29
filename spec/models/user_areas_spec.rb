require 'spec_helper'

describe UserAreas do
  it "should have a valid factory" do
    FactoryGirl.create(:user_areas).should be_valid 
  end
  it "should belong to an area" do
    should belong_to(:area) 
  end
  it "should belong to a client user" do
    should belong_to(:client) 
  end
end
