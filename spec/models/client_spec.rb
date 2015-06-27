require 'spec_helper'

describe Client do
  it "has a valid factory" do 
    FactoryGirl.create(:client).should be_valid 
  end
end
