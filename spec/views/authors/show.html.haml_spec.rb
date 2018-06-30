require 'rails_helper'

RSpec.describe "authors/show", type: :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :year => 2,
      :available => false,
      :section => "Section",
      :shelf => 3,
      :order => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/Section/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
