class Review < ApplicationRecord
  # relacion polimorfica
  belongs_to :reviewable, polymorphic: true
=begin
  Por medio de la consola se puede probar la relacion polimorfica con:
    Author.first.reviews << Review.new(texto:'esto es un comentario')
      o
    Book.first.reviews << Review.new(text:'esto es un comentario para un libro')
  lo anterior crea un review para un autor y para un book!
=end
end
