require 'spec_helper'

describe "accounts/edit" do
  before(:each) do
    @account = assign(:account, stub_model(Account,
      :name => "MyString",
      :client_code => "MyString",
      :subdomain => "MyString"
    ))
  end

  it "renders the edit account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", account_path(@account), "post" do
      assert_select "input#account_name[name=?]", "account[name]"
      assert_select "input#account_client_code[name=?]", "account[client_code]"
      assert_select "input#account_subdomain[name=?]", "account[subdomain]"
    end
  end
end
