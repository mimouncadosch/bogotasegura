require 'spec_helper'

describe "positions/new" do
  before(:each) do
    assign(:position, stub_model(Position,
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ).as_new_record)
  end

  it "renders new position form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => positions_path, :method => "post" do
      assert_select "input#position_address", :name => "position[address]"
      assert_select "input#position_latitude", :name => "position[latitude]"
      assert_select "input#position_longitude", :name => "position[longitude]"
    end
  end
end
