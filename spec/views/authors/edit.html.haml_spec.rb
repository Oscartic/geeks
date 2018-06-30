require 'rails_helper'

RSpec.describe "authors/edit", type: :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :year => 1,
      :available => false,
      :section => "MyString",
      :shelf => 1,
      :order => 1
    ))
  end

  it "renders the edit author form" do
    render

    assert_select "form[action=?][method=?]", author_path(@author), "post" do

      assert_select "input[name=?]", "author[first_name]"

      assert_select "input[name=?]", "author[last_name]"

      assert_select "input[name=?]", "author[email]"

      assert_select "input[name=?]", "author[year]"

      assert_select "input[name=?]", "author[available]"

      assert_select "input[name=?]", "author[section]"

      assert_select "input[name=?]", "author[shelf]"

      assert_select "input[name=?]", "author[order]"
    end
  end
end
