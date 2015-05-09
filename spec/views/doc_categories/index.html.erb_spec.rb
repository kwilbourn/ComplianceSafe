require 'spec_helper'

describe "doc_categories/index" do
  before(:each) do
    assign(:doc_categories, [
      stub_model(DocCategory,
        :name => "Name",
        :id => 1,
        :account_id => 2
      ),
      stub_model(DocCategory,
        :name => "Name",
        :id => 1,
        :account_id => 2
      )
    ])
  end

  it "renders a list of doc_categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
