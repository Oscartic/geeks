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

  # Ejemplo de pruba para el before_save en modelo Author
  context 'with an all-upcase last_name and all lowercase first_name' do
    let(:author) {FactoryBot.build(:author, first_name: 'John', last_name: 'SMITH')}
    it 'Should be titleized after save' do
      author.save
      expect(author.reload.to_s).to eq('John Smith')
    end
  end
end
