require 'spec_helper'

describe "areas/new" do
  before(:each) do
    assign(:area, stub_model(Area,
      :description => "MyString",
      :identifier => "MyString"
    ).as_new_record)
  end

  it "renders new area form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", areas_path, "post" do
      assert_select "input#area_description[name=?]", "area[description]"
      assert_select "input#area_identifier[name=?]", "area[identifier]"
    end
  end
end
