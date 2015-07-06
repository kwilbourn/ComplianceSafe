require 'spec_helper'

describe UserGroup do
  it "has a valid factory" do 
    FactoryGirl.create(:user_group).should be_valid 
  end
  it "is invalid without a user id" do
    FactoryGirl.build(:user_group, user_id: nil).should be_invalid
  end
  it "is invalid without a group id" do
    FactoryGirl.build(:user_group, group_id: nil).should be_invalid
  end
end
