require 'spec_helper'

describe DocCategory do
    describe "produces a count" do
      FactoryGirl.create(:doc_category)
      expect(doc_category.count).to be > 0
  end
end
