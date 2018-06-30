require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :year => 2,
        :available => false,
        :section => "Section",
        :shelf => 3,
        :order => 4
      ),
      Author.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :year => 2,
        :available => false,
        :section => "Section",
        :shelf => 3,
        :order => 4
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "Section".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
