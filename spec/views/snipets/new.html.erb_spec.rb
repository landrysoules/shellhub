require 'rails_helper'

RSpec.describe "snipets/new", type: :view do
  before(:each) do
    assign(:snipet, Snipet.new(
      :title => "MyString",
      :content => "MyString",
      :execution_output => "MyString"
    ))
  end

  it "renders new snipet form" do
    render

    assert_select "form[action=?][method=?]", snipets_path, "post" do

      assert_select "input#snipet_title[name=?]", "snipet[title]"

      assert_select "input#snipet_content[name=?]", "snipet[content]"

      assert_select "input#snipet_execution_output[name=?]", "snipet[execution_output]"
    end
  end
end
