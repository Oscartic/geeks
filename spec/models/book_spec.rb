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

  # Probando los metodos de clase
  describe "price_with_vat" do
    # probar que se esta aplicando el IVA (constante BOOK_VAT en clase Book.rb)
    it "should apply BOOK_VAT" do
      # para desacoplar la prueba de lo que se define en el metodo, se stubea la variable BOOK_VAT
      # y se le asigna un valor, con ello se puede hacer el test verificando que se realiza correctamente
      # la operacion, independiente del valor de la constante en el modelo:
      stub_const("Book::BOOK_VAT", 5)
      expect(Book.new(price: 100).price_with_vat).to eq(105)
    end
    # probar si el precio es 0, debe devolver 0
    it "Should retun 0 with price 0" do
      expect(Book.new(price: 0).price_with_vat).to eq(0)
    end
    # probar si el precio es nil
    it "Should retun nil with price nil" do
      expect(Book.new.price_with_vat).to eq(nil)
    end
  end
end
