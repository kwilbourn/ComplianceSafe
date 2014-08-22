require "spec_helper"

describe DocTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/doc_types").should route_to("doc_types#index")
    end

    it "routes to #new" do
      get("/doc_types/new").should route_to("doc_types#new")
    end

    it "routes to #show" do
      get("/doc_types/1").should route_to("doc_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/doc_types/1/edit").should route_to("doc_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/doc_types").should route_to("doc_types#create")
    end

    it "routes to #update" do
      put("/doc_types/1").should route_to("doc_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/doc_types/1").should route_to("doc_types#destroy", :id => "1")
    end

  end
end
