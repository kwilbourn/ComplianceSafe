require 'spec_helper'

describe "doc_categories/new" do
  before(:each) do
    assign(:doc_category, stub_model(DocCategory,
      :name => "MyString",
      :id => 1,
      :account_id => 1
    ).as_new_record)
  end

  it "renders new doc_category form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", doc_categories_path, "post" do
      assert_select "input#doc_category_name[name=?]", "doc_category[name]"
      assert_select "input#doc_category_id[name=?]", "doc_category[id]"
      assert_select "input#doc_category_account_id[name=?]", "doc_category[account_id]"
    end
  end
end
