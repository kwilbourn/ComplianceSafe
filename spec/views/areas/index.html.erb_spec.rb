require 'spec_helper'

describe "areas/index" do
  before(:each) do
    assign(:areas, [
      stub_model(Area,
        :description => "Description",
        :identifier => "Identifier"
      ),
      stub_model(Area,
        :description => "Description",
        :identifier => "Identifier"
      )
    ])
  end

  it "renders a list of areas" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Identifier".to_s, :count => 2
  end
end
