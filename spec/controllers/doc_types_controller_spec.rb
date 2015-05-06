require 'spec_helper'
describe DocTypesController do
  before do
      @area = FactoryGirl.create(:area)
    @doc_type = FactoryGirl.create(:doc_type)
    sign_in FactoryGirl.create(:user)
  end
  
  let(:valid_attributes) { FactoryGirl.attributes_for(:doc_type) } 

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DocTypesController. Be sure to keep this updated too.
  let(:valid_session) {FactoryGirl.attributes_for(:user)} 

  describe "GET index" do
    it "assigns all doc_types as @doc_types" do
      doc_type = FactoryGirl.create(:doc_type)
      get :index, {}, valid_session
      assigns(:doc_types).should eq([doc_type])
    end
  end

  describe "GET show" do
    it "assigns the requested doc_type as @doc_type" do
      doc_type = DocType.create! valid_attributes
      get :show, {:id => doc_type.to_param}, valid_session
      assigns(:doc_type).should eq(doc_type)
    end
  end

  describe "GET new" do
    it "assigns a new doc_type as @doc_type" do
      get :new, {}, valid_session
      assigns(:doc_type).should be_a_new(DocType)
    end
  end

  describe "GET edit" do
    it "assigns the requested doc_type as @doc_type" do
      doc_type = DocType.create! valid_attributes
      get :edit, {:id => doc_type.to_param}, valid_session
      assigns(:doc_type).should eq(doc_type)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new DocType" do
        expect {
          post :create, {:doc_type => valid_attributes}, valid_session
        }.to change(DocType, :count).by(1)
      end

      it "assigns a newly created doc_type as @doc_type" do
        post :create, {:doc_type => valid_attributes}, valid_session
        assigns(:doc_type).should be_a(DocType)
        assigns(:doc_type).should be_persisted
      end

      it "redirects to the created doc_type" do
        post :create, {:doc_type => valid_attributes}, valid_session
        response.should redirect_to(DocType.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved doc_type as @doc_type" do
        # Trigger the behavior that occurs when invalid params are submitted
        DocType.any_instance.stub(:save).and_return(false)
        post :create, {:doc_type => { "description" => "invalid value" }}, valid_session
        assigns(:doc_type).should be_a_new(DocType)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        DocType.any_instance.stub(:save).and_return(false)
        post :create, {:doc_type => { "description" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested doc_type" do
        doc_type = DocType.create! valid_attributes
        # Assuming there are no other doc_types in the database, this
        # specifies that the DocType created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        DocType.any_instance.should_receive(:update).with({ "description" => "MyString" })
        put :update, {:id => doc_type.to_param, :doc_type => { "description" => "MyString" }}, valid_session
      end

      it "assigns the requested doc_type as @doc_type" do
        doc_type = DocType.create! valid_attributes
        put :update, {:id => doc_type.to_param, :doc_type => valid_attributes}, valid_session
        assigns(:doc_type).should eq(doc_type)
      end

      it "redirects to the doc_type" do
        doc_type = DocType.create! valid_attributes
        put :update, {:id => doc_type.to_param, :doc_type => valid_attributes}, valid_session
        response.should redirect_to(doc_type)
      end
    end

    describe "with invalid params" do
      it "assigns the doc_type as @doc_type" do
        doc_type = DocType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DocType.any_instance.stub(:save).and_return(false)
        put :update, {:id => doc_type.to_param, :doc_type => { "description" => "invalid value" }}, valid_session
        assigns(:doc_type).should eq(doc_type)
      end

      it "re-renders the 'edit' template" do
        doc_type = DocType.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        DocType.any_instance.stub(:save).and_return(false)
        put :update, {:id => doc_type.to_param, :doc_type => { "description" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested doc_type" do
      doc_type = DocType.create! valid_attributes
      expect {
        delete :destroy, {:id => doc_type.to_param}, valid_session
      }.to change(DocType, :count).by(-1)
    end

    it "redirects to the doc_types list" do
      doc_type = DocType.create! valid_attributes
      delete :destroy, {:id => doc_type.to_param}, valid_session
      response.should redirect_to(doc_types_url)
    end
  end

end
