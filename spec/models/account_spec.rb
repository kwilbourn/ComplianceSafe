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
  it "has at least one user" do
  should validate(:account.require_at_least_one_user)
end
end
