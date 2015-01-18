require 'spec_helper'

describe "doc_types/index" do
  before(:each) do
    assign(:doc_types, [
      stub_model(DocType,
        :description => "Description",
        :issuing_authority => "Issuing Authority",
        :area_id => 1
      ),
      stub_model(DocType,
        :description => "Description",
        :issuing_authority => "Issuing Authority",
        :area_id => 1
      )
    ])
    assign(:user, [
      stub_model(User,
      :email => "johnd@example.com",
    :password => "changeme",
    :password_confirmation => "changeme")
    ])
  end

  it "renders a list of doc_types" do
    sign_in :user, @user 
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => "Issuing Authority".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
