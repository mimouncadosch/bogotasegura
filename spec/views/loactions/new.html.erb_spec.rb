require 'spec_helper'

describe "loactions/new" do
  before(:each) do
    assign(:loaction, stub_model(Loaction,
      :address => "MyString",
      :latitude => 1.5,
      :longitude => 1.5
    ).as_new_record)
  end

  it "renders new loaction form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => loactions_path, :method => "post" do
      assert_select "input#loaction_address", :name => "loaction[address]"
      assert_select "input#loaction_latitude", :name => "loaction[latitude]"
      assert_select "input#loaction_longitude", :name => "loaction[longitude]"
    end
  end
end
