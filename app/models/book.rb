class Book < ApplicationRecord
  # Relacion polimorfica con review:
  has_many :reviews, as: :reviewable
  # En rails 5 por defecto el :author_id es requerido por el tipo de asosiación
  # Para especificar lo contrario se añade => optional: true
  belongs_to :author, optional: true, counter_cache: true
  # counter_cache es una columna que almacena la cantidad de registos (libros de un Autor)
  # Para validar los nuevos registros se verifica con un condicional
  validates :author, presence: { if: :new_data? }

  # Scopes
  # libros que no tengan el titulo vacio:
  scope :with_title, -> { where.not(title: nil) }
  # Para obtener los mas resientes de determinada fecha
  scope :newer_than, -> (year) { where('year >= ?', year)}

  # Delegate
  # Con esto le indicamos a la clase Book que pueda acceder a propiedades de la clase padre Author:
  # delegate :first_name, to: :author
  # con lo anterior se puede ejecutar por ejemplo: Book.last.first_name y traera el nombre del autor
  # Si se desea trabajar con el prejifo de clase entonces serà:
  delegate :first_name, to: :author, prefix: true
  # y ahora la consulta se debe hacer asi: Book.last.author_first_name
  delegate :created_at, to: :author, prefix: true

  private
    def new_data?
      created_at.nil? || created_at > Date.new(2017, 11, 22)
    end
end
