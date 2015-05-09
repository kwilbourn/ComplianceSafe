require 'spec_helper'

describe "doc_types/new" do
  before(:each) do
    assign(:doc_type, stub_model(DocType,
      :description => "MyString",
      :issuing_authority => "MyString",
      :area_id => 1
    ).as_new_record)
  end

  it "renders new doc_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", doc_types_path, "post" do
      assert_select "input#doc_type_description[name=?]", "doc_type[description]"
      assert_select "input#doc_type_issuing_authority[name=?]", "doc_type[issuing_authority]"
      #assert_select "input#doc_type_area_id[name=?]", "doc_type[area_id]"
    end
  end
end
