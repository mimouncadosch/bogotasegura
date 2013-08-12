require 'spec_helper'

describe "locations/index" do
  before(:each) do
    assign(:locations, [
      stub_model(Location,
        :address => "Address",
        :latitude => "Latitude",
        :longitude => "Longitude"
      ),
      stub_model(Location,
        :address => "Address",
        :latitude => "Latitude",
        :longitude => "Longitude"
      )
    ])
  end

  it "renders a list of locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
  end
end
