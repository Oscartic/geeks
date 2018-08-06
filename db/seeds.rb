# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
authors = FactoryBot.create_list(:author, Random.rand(3..10))
authors.each {|author| FactoryBot.create_list(:book, Random.rand(0..6) * Random.rand(0..5), author: author)}
puts "+++++> ------- Seed done. Authors #{Author.count}, Books: #{Book.count}"
Country.find_or_create_by(code: 'es_ES', name: 'España');
Country.find_or_create_by(code: 'en_US', name: 'USA');