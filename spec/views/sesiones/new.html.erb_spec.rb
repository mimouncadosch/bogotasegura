require 'spec_helper'

describe "sesiones/new" do
  before(:each) do
    assign(:sesione, stub_model(Sesione).as_new_record)
  end

  it "renders new sesione form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sesiones_path, :method => "post" do
    end
  end
end
