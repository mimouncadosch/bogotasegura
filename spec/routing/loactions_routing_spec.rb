require "spec_helper"

describe LoactionsController do
  describe "routing" do

    it "routes to #index" do
      get("/loactions").should route_to("loactions#index")
    end

    it "routes to #new" do
      get("/loactions/new").should route_to("loactions#new")
    end

    it "routes to #show" do
      get("/loactions/1").should route_to("loactions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/loactions/1/edit").should route_to("loactions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/loactions").should route_to("loactions#create")
    end

    it "routes to #update" do
      put("/loactions/1").should route_to("loactions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/loactions/1").should route_to("loactions#destroy", :id => "1")
    end

  end
end
