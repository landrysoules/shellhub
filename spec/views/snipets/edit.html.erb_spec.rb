require 'rails_helper'

RSpec.describe "snipets/edit", type: :view do
  before(:each) do
    @snipet = assign(:snipet, Snipet.create!(
      :title => "MyString",
      :content => "MyString",
      :execution_output => "MyString"
    ))
  end

  it "renders the edit snipet form" do
    render

    assert_select "form[action=?][method=?]", snipet_path(@snipet), "post" do

      assert_select "input#snipet_title[name=?]", "snipet[title]"

      assert_select "input#snipet_content[name=?]", "snipet[content]"

      assert_select "input#snipet_execution_output[name=?]", "snipet[execution_output]"
    end
  end
end
