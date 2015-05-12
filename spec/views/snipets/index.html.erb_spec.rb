require 'rails_helper'

RSpec.describe "snipets/index", type: :view do
  include Devise::TestHelpers
  before(:each) do
    assign(:snipets, [
      Snipet.create!(
        :title => "Title",
        :content => "Content",
        :execution_output => "Execution Output"
      ),
      Snipet.create!(
        :title => "Title",
        :content => "Content",
        :execution_output => "Execution Output"
      )
    ])
  end

  it "renders a list of snipets" do
    render
    assert_select ".panel-title", :text => "Title".to_s, :count => 2
  end
end
