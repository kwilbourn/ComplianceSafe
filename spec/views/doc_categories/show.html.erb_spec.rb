require 'spec_helper'

describe "doc_categories/show" do
  before(:each) do
    @doc_category = assign(:doc_category, stub_model(DocCategory,
      :name => "Name",
      :id => 1,
      :account_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
