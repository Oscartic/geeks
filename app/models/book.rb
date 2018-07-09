class Book < ApplicationRecord
  # Relacion polimorfica con review:
  has_many :reviews, as: :reviewable
  # En rails 5 por defecto el :author_id es requerido por el tipo de asosiación
  # Para especificar lo contrario se añade => optional: true
  belongs_to :author, optional: true, counter_cache: true
  # counter_cache es una columna que almacena la cantidad de registos (libros de un Autor)
  # Para validar los nuevos registros se verifica con un condicional
  validates :author, presence: { if: :new_data? }

  private
    def new_data?
      created_at.nil? || created_at > Date.new(2017, 11, 22)
    end
end
