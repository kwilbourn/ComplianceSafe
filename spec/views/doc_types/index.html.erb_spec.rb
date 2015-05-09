require 'spec_helper'
require 'factory_girl_rails'
describe "doc_types/index" do
  before(:each) do
    @doc_type = FactoryGirl.create(:doc_type)
    assign(:doc_types, [@doc_type])
    render
  end

  it "renders a list of doc_types" do
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Example Doc Type".to_s, :count => 1
    assert_select "tr>td", :text => "Example Issuing Authority".to_s, :count => 1
  end
end
