require 'ffaker'
FactoryBot.define do
  factory :author do
    first_name {FFaker::Name.first_name}
    last_name {FFaker::Name.last_name}
    email { "#{first_name}@#{last_name}.com".downcase }
    # Los trait son una especie de grupos de datos que se pueden o no asignar.
    # si yo ejecuto FactoryBot.build(:author), esto creará un Autor sin los datos de
    # location, pero si yo ejecuto FactoryBot.build(:author, :location), al nuevo Autor
    # se le asignaran los datos del trait location.
    trait :location do
      year 2018
      section "Sala B"
      shelf 4
      order 2
    end

    # Dentro de la factoria, se puede crear otra factoria que incluya el trait.
    factory :author_full_data, traits: [:location]
    # para ejecutarla se deberia correr asi:
    # FactoryBot.build(:author_full_data)
  end
end
