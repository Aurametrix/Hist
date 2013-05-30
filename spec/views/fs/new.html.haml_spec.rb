require 'spec_helper'

describe "fs/new.html.haml" do
  before(:each) do
    assign(:f, stub_model(F,
      :new_record? => true,
      :name => "MyString",
      :type => "MyString",
      :description => "MyString"
    ))
  end

  it "renders new f form" do
    render

    rendered.should have_selector("form", :action => fs_path, :method => "post") do |form|
      form.should have_selector("input#f_name", :name => "f[name]")
      form.should have_selector("input#f_type", :name => "f[type]")
      form.should have_selector("input#f_description", :name => "f[description]")
    end
  end
end
