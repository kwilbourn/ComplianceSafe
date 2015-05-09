require 'spec_helper'

describe Account do
  it "has many users" do
     should have_many(:users).dependent(:destroy) 
  end
    it "has many document types" do
     should have_many(:document_types)
  end
    it "has many documents" do
     should have_many(:documents).dependent(:destroy) 
  end
end
