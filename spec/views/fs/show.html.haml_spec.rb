require 'spec_helper'

describe "fs/show.html.haml" do
  before(:each) do
    @f = assign(:f, stub_model(F,
      :name => "Name",
      :type => "Type",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain("Name".to_s)
    rendered.should contain("Type".to_s)
    rendered.should contain("Description".to_s)
  end
end
