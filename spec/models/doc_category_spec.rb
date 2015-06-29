require 'spec_helper'

describe DocCategory do
  it "has a valid factory" do 
    FactoryGirl.create(:document_category).should be_valid 
  end
  
 it "produces a count" do
         @example = FactoryGirl.create(:document_category)      
         DocumentCategory.count.should be > 0
 end
end
