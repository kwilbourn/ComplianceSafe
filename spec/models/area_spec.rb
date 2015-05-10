require 'spec_helper'

describe Area do
  it "has a valid factory" do
    FactoryGirl.create(:area).should be_valid
  end
  it "is invalid without a description" do
    FactoryGirl.build(:area, description: nil).should be_invalid
  end
  it "is invalid without an area identifier" do
    FactoryGirl.build(:area, identifier: nil).should be_invalid
  end
  it "should have many doc types" do
    should have_many(:doc_types)
  end
  it "should not accept descriptions that are too short" do
    FactoryGirl.build(:area, description: "ab").should be_invalid
  end
  
end
