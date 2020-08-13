require 'open-uri'
require 'json'

Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
serialized_ingredients = open(url).read
ingredients = JSON.parse(serialized_ingredients)

puts "Generating ingredients..."
ingredients["drinks"].each do  |ingredient|
  Ingredient.create(name: ingredient["strIngredient1"])
end

puts "Generating cocktails..."
10.times do 
  cocktail = Cocktail.new(
    name: Faker::JapaneseMedia::OnePiece.character
  )
  cocktail.save!
end

puts "Finished!"

