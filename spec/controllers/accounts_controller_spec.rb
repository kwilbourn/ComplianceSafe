require 'spec_helper'
describe AccountsController do
  before do
    @account = FactoryGirl.create(:account)
    sign_in FactoryGirl.create(:user)
  end
  let(:valid_attributes) { account = FactoryGirl.attributes_for(:account)}

  let(:valid_session)  { FactoryGirl.attributes_for(:user) } 

  describe "GET index" do
    it "assigns all accounts as @accounts" do
      #accounts = Account.create! valid_attributes
      get :index, {}, valid_session
      assigns(:accounts).should eq([@account])
    end
  end

  describe "GET show" do
    it "assigns the requested account as @account" do
      account = Account.create! valid_attributes
      get :show, {:id => account.to_param}, valid_session
      assigns(:account).should eq(account)
    end
  end

  describe "GET new" do
    it "assigns a new account as @account" do
      get :new, {}, valid_session
      assigns(:account).should be_a_new(Account)
    end
  end

  describe "GET edit" do
    it "assigns the requested account as @account" do
      account = Account.create! valid_attributes
      get :edit, {:id => account.to_param}, valid_session
      assigns(:account).should eq(account)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Account" do
        expect {
          post :create, {:account => valid_attributes}, valid_session
        }.to change(Account, :count).by(1)
      end

      it "assigns a newly created account as @account" do
        post :create, {:account => valid_attributes}, valid_session
        assigns(:account).should be_a(Account)
        assigns(:account).should be_persisted
      end

      it "redirects to the created account" do
        post :create, {:account => valid_attributes}, FactoryGirl.attributes_for(:user)
        response.should redirect_to(documents_path)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved account as @account" do
        # Trigger the behavior that occurs when invalid params are submitted
        Account.any_instance.stub(:save).and_return(false)
        post :create, {:account => { "name" => "" }}, valid_session
        assigns(:account).should be_a_new(Account)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Account.any_instance.stub(:save).and_return(false)
        post :create, {:account => { "name" => "" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested account" do
        account = Account.create! valid_attributes
        # Assuming there are no other accounts in the database, this
        # specifies that the Account created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Account.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => account.to_param, :account => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested account as @account" do
        account = Account.create! valid_attributes
        put :update, {:id => account.to_param, :account => valid_attributes}, valid_session
        assigns(:account).should eq(account)
      end

      it "redirects to the account" do
        account = Account.create! valid_attributes
        put :update, {:id => account.to_param, :account => valid_attributes}, valid_session
        response.should redirect_to(account)
      end
    end

    describe "with invalid params" do
      it "assigns the account as @account" do
        account = Account.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Account.any_instance.stub(:save).and_return(false)
        put :update, {:id => account.to_param, :account => { "name" => "invalid value" }}, valid_session
        assigns(:account).should eq(account)
      end

      it "re-renders the 'edit' template" do
        account = Account.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Account.any_instance.stub(:save).and_return(false)
        put :update, {:id => account.to_param, :account => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end
end
