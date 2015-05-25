require 'spec_helper'

describe DocCategory do
  it "has a valid factory" do 
    FactoryGirl.create(:doc_category).should be_valid 
  end
  
 it "produces a count" do
         @example = FactoryGirl.create(:doc_category)      
         DocCategory.count.should be > 0
 end
end
