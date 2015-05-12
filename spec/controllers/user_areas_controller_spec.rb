require 'spec_helper'

describe UserAreasController do
 before do
   sign_in FactoryGirl.create(:user)
 end
 let(:valid_session) {FactoryGirl.attributes_for(:user)}
  describe "GET 'index'" do
    it "returns http success" do
      get :index, {}, valid_session
      should respond_with(:success)
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      get :update, {}, valid_session
      should respond_with(:success)
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      get :create, {}, valid_session
      should respond_with(:success)
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get :edit, {}, valid_session
      should respond_with(:success)
    end
  end

end
