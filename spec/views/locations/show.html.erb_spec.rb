require 'spec_helper'

describe "locations/show" do
  before(:each) do
    @location = assign(:location, stub_model(Location,
      :address => "Address",
      :latitude => "Latitude",
      :longitude => "Longitude"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Address/)
    rendered.should match(/Latitude/)
    rendered.should match(/Longitude/)
  end
end
