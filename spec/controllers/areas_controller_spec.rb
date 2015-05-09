require 'spec_helper'



describe AreasController do
  before do
    @area = FactoryGirl.create(:area)
    sign_in FactoryGirl.create(:user)
  end
  # This should return the minimal set of attributes required to create a valid
  # Area. As you add validations to Area, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "description" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AreasController. Be sure to keep this updated too.
  let(:valid_session) {FactoryGirl.attributes_for(:user)}

  describe "GET index" do
    it "should respond with success" do
      get :index, {}, valid_session
      should respond_with(:success)
    end
    it "assigns all areas as @areas" do
      get :index, {}, valid_session
      assigns(:areas).should eq([@area])
    end
  end

  describe "GET show" do
    it "assigns the requested area as @area" do
      area = Area.create! valid_attributes
      get :show, {:id => area.to_param}, valid_session
      assigns(:area).should eq(area)
    end
  end

  describe "GET new" do
    it "assigns a new area as @area" do
      get :new, {}, valid_session
      assigns(:area).should be_a_new(Area)
    end
  end

  describe "GET edit" do
    it "assigns the requested area as @area" do
      area = Area.create! valid_attributes
      get :edit, {:id => area.to_param}, valid_session
      assigns(:area).should eq(area)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Area" do
        expect {
          post :create, {:area => valid_attributes}, valid_session
        }.to change(Area, :count).by(1)
      end

      it "assigns a newly created area as @area" do
        post :create, {:area => valid_attributes}, valid_session
        assigns(:area).should be_a(Area)
        assigns(:area).should be_persisted
      end

      it "redirects to the created area" do
        post :create, {:area => valid_attributes}, valid_session
        response.should redirect_to(Area.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved area as @area" do
        # Trigger the behavior that occurs when invalid params are submitted
        Area.any_instance.stub(:save).and_return(false)
        post :create, {:area => { "description" => "invalid value" }}, valid_session
        assigns(:area).should be_a_new(Area)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Area.any_instance.stub(:save).and_return(false)
        post :create, {:area => { "description" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested area" do
        area = Area.create! valid_attributes
        # Assuming there are no other areas in the database, this
        # specifies that the Area created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Area.any_instance.should_receive(:update).with({ "description" => "MyString" })
        put :update, {:id => area.to_param, :area => { "description" => "MyString" }}, valid_session
      end

      it "assigns the requested area as @area" do
        area = Area.create! valid_attributes
        put :update, {:id => area.to_param, :area => valid_attributes}, valid_session
        assigns(:area).should eq(area)
      end

      it "redirects to the area" do
        area = Area.create! valid_attributes
        put :update, {:id => area.to_param, :area => valid_attributes}, valid_session
        response.should redirect_to(area)
      end
    end

    describe "with invalid params" do
      it "assigns the area as @area" do
        area = Area.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Area.any_instance.stub(:save).and_return(false)
        put :update, {:id => area.to_param, :area => { "description" => "invalid value" }}, valid_session
        assigns(:area).should eq(area)
      end

      it "re-renders the 'edit' template" do
        area = Area.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Area.any_instance.stub(:save).and_return(false)
        put :update, {:id => area.to_param, :area => { "description" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested area" do
      area = Area.create! valid_attributes
      expect {
        delete :destroy, {:id => area.to_param}, valid_session
      }.to change(Area, :count).by(-1)
    end

    it "redirects to the areas list" do
      area = Area.create! valid_attributes
      delete :destroy, {:id => area.to_param}, valid_session
      response.should redirect_to(areas_url)
    end
  end

end
