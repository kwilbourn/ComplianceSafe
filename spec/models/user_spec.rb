require 'spec_helper'

describe User do
  it "has a valid factory" do 
    FactoryGirl.create(:user).should be_valid 
  end
    it "has many documents" do
     should have_many(:documents).dependent(:destroy) 
  end
end