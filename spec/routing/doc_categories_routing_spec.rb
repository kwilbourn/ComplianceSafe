require "spec_helper"

describe DocCategoriesController do
  describe "routing" do

    it "routes to #index" do
      get("/doc_categories").should route_to("doc_categories#index")
    end

    it "routes to #new" do
      get("/doc_categories/new").should route_to("doc_categories#new")
    end

    it "routes to #show" do
      get("/doc_categories/1").should route_to("doc_categories#show", :id => "1")
    end

    it "routes to #edit" do
      get("/doc_categories/1/edit").should route_to("doc_categories#edit", :id => "1")
    end

    it "routes to #create" do
      post("/doc_categories").should route_to("doc_categories#create")
    end

    it "routes to #update" do
      put("/doc_categories/1").should route_to("doc_categories#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/doc_categories/1").should route_to("doc_categories#destroy", :id => "1")
    end

  end
end
