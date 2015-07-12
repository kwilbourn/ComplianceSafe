require 'spec_helper'

describe UserGroup do
  it "has a valid factory" do 
    FactoryGirl.create(:user_group).should be_valid 
  end
  it "is invalid without a client id" do
    FactoryGirl.build(:user_group, client_id: nil).should be_invalid
  end
  it "is invalid without a group id" do
    FactoryGirl.build(:user_group, group_id: nil).should be_invalid
  end
  it "should belong to a group" do
    should belong_to(:group) 
  end
  it "should belong to a client" do
    should belong_to(:client) 
  end
  
end
