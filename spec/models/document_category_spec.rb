require 'spec_helper'

describe DocumentCategory do
  it "has a valid factory" do
    #pending
  end
  it "is invalid without a name" do
    #pending
  end
  it {should have_many(:documents)}
  describe "produces a count" do
    expect(document_category.count).to be > 0
  end
end
