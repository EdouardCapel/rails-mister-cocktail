# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

puts 'Cleaning database...'
Cocktail.destroy_all

puts 'Creating cocktail...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
cocktail_serialized = open(url).read
cocktail_list = JSON.parse(cocktail_serialized)

cocktail_list['drinks'].each do |cocktail_name|
  Ingredient.create!(name: cocktail_name['strIngredient1'])
end

puts 'DB Seeding of all cocktail completed!'
