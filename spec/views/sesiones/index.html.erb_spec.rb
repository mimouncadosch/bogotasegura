require 'spec_helper'

describe "sesiones/index" do
  before(:each) do
    assign(:sesiones, [
      stub_model(Sesione),
      stub_model(Sesione)
    ])
  end

  it "renders a list of sesiones" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
