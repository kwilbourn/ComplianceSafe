require 'spec_helper'

describe Account do
  it "has a valid factory" do 
    FactoryGirl.create(:account).should be_valid 
  end
   it "has many users" do
     should have_many(:users).dependent(:destroy) 
  end
    it "has many document categories" do
     should have_many(:document_categories)
  end
    it "has many documents" do
     should have_many(:documents).dependent(:destroy) 
  end
  it "requires at least one user" do
    FactoryGirl.build(:account, client_manager: nil).should_not be_valid
  end
  it "is invalid without a name" do
    FactoryGirl.build(:account, name: nil).should_not be_valid
  end
  it "is invalid without a subdomain" do
    FactoryGirl.build(:account, subdomain: nil).should_not be_valid
  end
end
