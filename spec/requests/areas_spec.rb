require 'spec_helper'

describe "Areas" do
  before do
    @areas = FactoryGirl.create(:area)
  end
  describe "GET /areas" do
    it "works!" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get areas_path
      response.status.should be(200)
    end
  end
end
