require 'spec_helper'

describe Area do
  it "has a valid factory" do
    FactoryGirl.create(:area).should be_valid
  end
end
