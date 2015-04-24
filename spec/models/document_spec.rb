require 'spec_helper'

describe Document do
  
  it { should belong_to(:doc_type)}
  describe "#recoginizes expired items?" do
    let!(:document) {Document.create(name: "test", permit_number: "1234", expiration_date: "2016-08-18", doc_type_id: 2, user_id: 1)}
    
    it "returns expired with out of date items" do
      document.update_attributes(expiration_date: "2012-08-18")
      expect(document.days_left?).to be < 0
    end
    it "returns false when not expired" do
      document.update_attributes(expiration_date: "2020-08-18")
      expect(document.days_left?).to be > 0
    end
    
  end
end
