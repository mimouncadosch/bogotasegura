require 'spec_helper'

describe "usuarios/index" do
  before(:each) do
    assign(:usuarios, [
      stub_model(Usuario),
      stub_model(Usuario)
    ])
  end

  it "renders a list of usuarios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
