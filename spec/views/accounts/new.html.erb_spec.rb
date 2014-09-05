require 'spec_helper'

describe "accounts/new" do
  before(:each) do
    assign(:account, stub_model(Account,
      :name => "MyString",
      :client_code => "MyString",
      :subdomain => "MyString"
    ).as_new_record)
  end

  it "renders new account form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accounts_path, "post" do
      assert_select "input#account_name[name=?]", "account[name]"
      assert_select "input#account_client_code[name=?]", "account[client_code]"
      assert_select "input#account_subdomain[name=?]", "account[subdomain]"
    end
  end
end
