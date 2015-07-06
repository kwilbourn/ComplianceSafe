require 'spec_helper'

describe Group do
  it "has a valid factory" do 
    FactoryGirl.create(:group).should be_valid 
  end
   it "is invalid without a name" do
    FactoryGirl.build(:group, name: nil).should_not be_valid
  end
  it "is invalid with an blank name" do 
    FactoryGirl.build(:group, name: " ").should_not be_valid
  end
  it "is invalid with a name that is too short" do
    FactoryGirl.build(:group, name: "ab").should_not be_valid
  end
  it "is invalid with a name that is too long" do
    FactoryGirl.build(:group, name: "abcde fghij klmno pqrst uvwxy zabcd efghi jklmn opqrs").should_not be_valid
  end
end
