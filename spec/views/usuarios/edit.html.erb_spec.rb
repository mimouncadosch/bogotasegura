require 'spec_helper'

describe "usuarios/edit" do
  before(:each) do
    @usuario = assign(:usuario, stub_model(Usuario))
  end

  it "renders the edit usuario form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => usuarios_path(@usuario), :method => "post" do
    end
  end
end
