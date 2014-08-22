require 'spec_helper'

describe "doc_types/show" do
  before(:each) do
    @doc_type = assign(:doc_type, stub_model(DocType,
      :description => "Description",
      :issuing_authority => "Issuing Authority",
      :area_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Description/)
    rendered.should match(/Issuing Authority/)
    rendered.should match(/1/)
  end
end
