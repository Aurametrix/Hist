require 'spec_helper'

describe "fs/edit.html.haml" do
  before(:each) do
    @food = assign(:f, stub_model(Food,
      :new_record? => false,
      :name => "MyString",
      :type => "MyString",
      :description => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    rendered.should have_selector("form", :action => food_path(@f), :method => "post") do |form|
      form.should have_selector("input#food_name", :name => "f[name]")
      form.should have_selector("input#food_type", :name => "f[type]")
      form.should have_selector("input#food_description", :name => "f[description]")
    end
  end
end
