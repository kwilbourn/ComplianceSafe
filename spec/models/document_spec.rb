require 'spec_helper'

describe Document do
  it { should belong_to(:document_type)}
  describe "#recoginizes expired items?" do
    let(:document) {Document.create(name: "test", permit_number: "1234", expiration_date: "2016-08-18", type_ID: 2, user_ID: 1)}
    
    it "returns expired with out of date items" do
      document.create(expiration_date: "2012-08-18")
      expect(document.expired?).to be_true
    end
    it "returns false when not expired" do
      document.create(expiration_date: "2020-08-18")
      expect(document.expired?).to be_false
    end
    
  end
end
