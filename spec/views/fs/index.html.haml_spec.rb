require 'spec_helper'

describe "fs/index.html.haml" do
  before(:each) do
    assign(:fs, [
      stub_model(F,
        :name => "Name",
        :type => "Type",
        :description => "Description"
      ),
      stub_model(F,
        :name => "Name",
        :type => "Type",
        :description => "Description"
      )
    ])
  end

  it "renders a list of items" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Type".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Description".to_s, :count => 2)
  end
end

