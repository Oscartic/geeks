class Book < ApplicationRecord
  # En rails 5 por defecto el :author_id es requerido por el tipo de asosiación
  # Para especificar lo contrario se añade => optional: true
  belongs_to :author, optional: true
  # Para validar los nuevos registros se verifica con un condicional
  validates :author, presence: { if: :new_data? }

  private
    def new_data?
      created_at.nil? || created_at > Date.new(2017, 11, 22)
    end
end
