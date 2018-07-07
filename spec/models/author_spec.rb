require 'rails_helper'

RSpec.describe Author, type: :model do
  #Validacion de la factoria en Author
  it "Should have a valid factory" do
    expect(FactoryBot.build(:author)).to be_valid
  end

  #validacion de email
  it "Should require email" do
    expect(FactoryBot.build(:author, email: "")).not_to be_valid
  end

  # prueba realizada con gema Shoulda::Matchers
  it {is_expected.to validate_presence_of(:first_name) }
end
