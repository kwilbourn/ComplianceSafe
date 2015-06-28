require 'spec_helper'

describe Client do
  it "has a valid factory" do 
    FactoryGirl.create(:client).should be_valid 
  end
  it "belongs to one account" do
     should belong_to(:account) 
  end
  it "has many documents" do
     should have_many(:documents).dependent(:destroy) 
  end
end
