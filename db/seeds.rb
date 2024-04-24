# frozen_string_literal: true

# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Recipe.destroy_all
Instruction.destroy_all
RecipeIngredient.destroy_all
Ingredient.destroy_all

# #INGREDIENTS
# Épices
Ingredient.create(name: 'poivre')
Ingredient.create(name: 'sel')
Ingredient.create(name: 'sucre')
Ingredient.create(name: 'paprika')
Ingredient.create(name: 'curry')
Ingredient.create(name: 'cumin')
Ingredient.create(name: 'tonka')
Ingredient.create(name: 'canelle')
Ingredient.create(name: 'muscade')
Ingredient.create(name: 'herbes de provence')
Ingredient.create(name: 'basilic')
Ingredient.create(name: 'origan')
Ingredient.create(name: 'thym')
Ingredient.create(name: 'coriandre')
Ingredient.create(name: 'aneth')
Ingredient.create(name: 'feuille de laurier')
Ingredient.create(name: 'beurre')

# Laits, crèmes, fromages
Ingredient.create(name: 'crème fraîche')
Ingredient.create(name: 'oeuf')
Ingredient.create(name: 'lait')
Ingredient.create(name: 'lait de soja')
Ingredient.create(name: 'lait de coco')
Ingredient.create(name: "lait d'amande")
gruyere = Ingredient.create(name: 'gruyère')
Ingredient.create(name: 'comté')
Ingredient.create(name: 'chèvre')
Ingredient.create(name: 'fromage à raclette')

# Légumes
Ingredient.create(name: 'ail')
Ingredient.create(name: 'avocat')
courgette = Ingredient.create(name: 'courgette')
Ingredient.create(name: 'concombre')
Ingredient.create(name: 'carotte')
Ingredient.create(name: 'échalotte')
Ingredient.create(name: 'pomme de terre')
Ingredient.create(name: 'chou-fleur')
Ingredient.create(name: 'chou-chinois')
Ingredient.create(name: 'courge')
Ingredient.create(name: 'endive')
Ingredient.create(name: 'épinards')
Ingredient.create(name: 'haricots vert')
Ingredient.create(name: 'laitue')
Ingredient.create(name: 'oignon')
Ingredient.create(name: 'panais')
Ingredient.create(name: 'poireau')
Ingredient.create(name: 'petit pois')
Ingredient.create(name: 'poivron')
Ingredient.create(name: 'potiron')
Ingredient.create(name: 'radis')
Ingredient.create(name: 'rhubarbe')
Ingredient.create(name: 'salsifis')
Ingredient.create(name: 'topinambour')

# Sauces et huiles
Ingredient.create(name: 'sauce soya')
Ingredient.create(name: "sauce d'huitres")
Ingredient.create(name: "huile d'olives")
Ingredient.create(name: "huile d'amande")
Ingredient.create(name: 'huile de tournesol')
Ingredient.create(name: 'huile de sésame')
Ingredient.create(name: 'huile de canola')
Ingredient.create(name: 'huile de coco')
Ingredient.create(name: 'vinaigre')
Ingredient.create(name: 'vinaire de riz')
Ingredient.create(name: 'mirin')

# #RECIPES
gratin_courgettes = Recipe.create(
  title: 'Gratin de courgettes',
  description: 'Un bon gratin de courgettes!',
  image: 'https://assets.afcdn.com/recipe/20190529/93185_w600.jpg'
)

# #RECIPE_INGREDIENTS
RecipeIngredient.create(
  recipe_id: gratin_courgettes.id,
  ingredient_id: courgette.id,
  unity: 'g',
  quantity: 250
)
RecipeIngredient.create(
  recipe_id: gratin_courgettes.id,
  ingredient_id: gruyere.id,
  unity: 'g',
  quantity: 50
)

# #INSTRUCTIONS
Instruction.create(
  step: 1,
  instruction: 'Râper les courgettes',
  recipe_id: gratin_courgettes.id
)
Instruction.create(
  step: 2,
  instruction: 'Mélanger et cuire au four à 180 degré pendant 20 minutes',
  recipe_id: gratin_courgettes.id
)
