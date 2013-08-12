require 'spec_helper'

describe "sesiones/show" do
  before(:each) do
    @sesione = assign(:sesione, stub_model(Sesione))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
