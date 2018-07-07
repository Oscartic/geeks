require 'rails_helper'

RSpec.describe Book, type: :model do
  #Validacion de la factoria en Book
  it "Should have a valid factory" do
    expect(FactoryBot.build(:book)).to be_valid
  end

  # validacion que aplica para los nuevos registros pero no asi con los registros ya almacenados
  it "Should require author on new book" do
    expect(FactoryBot.build(:book, author_id: nil)).not_to be_valid
  end
  # Si es reciente no es valido el campo author_id
  it "Should require author on new book if recent" do
    expect(FactoryBot.build(:book, created_at: 1.minute.ago, author_id: nil)).not_to be_valid
  end
  # Pero si es antiguo si es valido
  it "Should require author on old record book" do
    expect(FactoryBot.build(:book, created_at: Date.new(2016,1,1), author_id: nil)).to be_valid
  end
end
