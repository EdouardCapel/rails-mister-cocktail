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
Ingredient.destroy_all
Dose.destroy_all
Glass.destroy_all

puts 'Creating ingredients...'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
ingredient_serialized = open(url).read
ingredient_list = JSON.parse(ingredient_serialized)

db_ingredient_list = []

ingredient_list['drinks'].each do |ingredient_name|
  ingredient = Ingredient.create!(name: ingredient_name['strIngredient1'])
  db_ingredient_list << ingredient
end

puts 'Creating glasses...'

highball = Glass.create!(name: 'Highball')
lowball = Glass.create!(name: 'Lowball')
cocktail = Glass.create!(name: 'Cocktail')
flute = Glass.create!(name: 'Flute')
whitewine = Glass.create!(name: 'White wine')
redwine = Glass.create!(name: 'Red wine')
martini = Glass.create!(name: 'Martini')
irishcoffe = Glass.create!(name: 'Irish coffee')
hurricane = Glass.create!(name: 'Hurricane')
margarita = Glass.create!(name: 'Margarita')
glencairn = Glass.create!(name: 'Glencairn')
snifter = Glass.create!(name: 'Snifter')

puts 'Creating cocktails...'

old_fash = Cocktail.create!(name: 'old fashioned', glass: highball)
mojito = Cocktail.create!(name: 'mojito', glass: highball)
daiquiri = Cocktail.create!(name: 'daiquiri')
caipirina = Cocktail.create!(name: 'caipirina')
margarita = Cocktail.create!(name: 'margarita')
bloody_mary = Cocktail.create!(name: 'bloody mary')
moscow_mule = Cocktail.create!(name: 'moscow mule')
michelada = Cocktail.create!(name: 'michelada')

puts 'Creating doses...'

Dose.create!(description: "2 oz of" ,ingredient: db_ingredient_list.sample, cocktail: old_fash)
Dose.create!(description: "2 oz of" ,ingredient: db_ingredient_list.sample, cocktail: mojito)
Dose.create!(description: "2 oz of" ,ingredient: db_ingredient_list.sample, cocktail: daiquiri)

puts 'DB Seeding of all cocktail completed!'
