require 'spec_helper'

describe DocType do
  it "has a valid factory" do
    FactoryGirl.create(:doc_type).should be_valid
  end
  it "is invalid without a description" do
    FactoryGirl.build(:doc_type, description: nil).should be_invalid
  end
    it "is invalid without an issuing authority" do
    FactoryGirl.build(:doc_type, issuing_authority: nil).should be_invalid
  end
end
