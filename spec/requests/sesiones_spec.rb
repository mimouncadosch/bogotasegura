require 'spec_helper'

describe "Sesiones" do
  describe "GET /sesiones" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get sesiones_path
      response.status.should be(200)
    end
  end
end
