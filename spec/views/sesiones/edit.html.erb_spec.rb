require 'spec_helper'

describe "sesiones/edit" do
  before(:each) do
    @sesione = assign(:sesione, stub_model(Sesione))
  end

  it "renders the edit sesione form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sesiones_path(@sesione), :method => "post" do
    end
  end
end
