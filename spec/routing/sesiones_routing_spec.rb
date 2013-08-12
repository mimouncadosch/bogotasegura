require "spec_helper"

describe SesionesController do
  describe "routing" do

    it "routes to #index" do
      get("/sesiones").should route_to("sesiones#index")
    end

    it "routes to #new" do
      get("/sesiones/new").should route_to("sesiones#new")
    end

    it "routes to #show" do
      get("/sesiones/1").should route_to("sesiones#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sesiones/1/edit").should route_to("sesiones#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sesiones").should route_to("sesiones#create")
    end

    it "routes to #update" do
      put("/sesiones/1").should route_to("sesiones#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sesiones/1").should route_to("sesiones#destroy", :id => "1")
    end

  end
end
