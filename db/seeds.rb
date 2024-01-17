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
RecipeIngredient.destroy_all
Ingredient.destroy_all
Unity.destroy_all
Quantity.destroy_all



##INGREDIENTS
#Épices
poivre = Ingredient.create(name:'poivre');
sel = Ingredient.create(name:'sel');
sucre = Ingredient.create(name:'sucre');
paprika = Ingredient.create(name:'paprika');
curry = Ingredient.create(name:'curry');
cumin = Ingredient.create(name:'cumin');
tonka = Ingredient.create(name:'tonka');
canelle = Ingredient.create(name:'canelle');
muscade = Ingredient.create(name:'muscade');
herbes_provence = Ingredient.create(name:'herbes de provence');
basilic = Ingredient.create(name:'basilic');
origan = Ingredient.create(name:'origan');
thym = Ingredient.create(name:'thym');
coriandre = Ingredient.create(name:'coriandre');
aneth = Ingredient.create(name:'aneth');
laurier = Ingredient.create(name:'feuille de laurier');
beurre = Ingredient.create(name:'beurre');

#Laits, crèmes, fromages
creme_fraiche = Ingredient.create(name:'crème fraîche');
oeuf = Ingredient.create(name:'oeuf');
lait = Ingredient.create(name:'lait');
lait_soja = Ingredient.create(name:'lait de soja');
lait_coco = Ingredient.create(name:'lait de coco');
lait_amande = Ingredient.create(name:"lait d'amande");
gruyere = Ingredient.create(name:'gruyère');
comte = Ingredient.create(name:'comté');
chevre = Ingredient.create(name:'chèvre');
raclette = Ingredient.create(name:'fromage à raclette');

#Légumes
ail = Ingredient.create(name:"ail");
avocat = Ingredient.create(name:"avocat");
courgette = Ingredient.create(name:'courgette');
concombre = Ingredient.create(name:'concombre');
carotte = Ingredient.create(name:'carotte');
echalotte = Ingredient.create(name:'échalotte');
pomme_de_terre = Ingredient.create(name:'pomme de terre');
chou_fleur = Ingredient.create(name:'chou-fleur');
chou_chinois = Ingredient.create(name:'chou-chinois');
courge = Ingredient.create(name:'courge');
endive = Ingredient.create(name:'endive');
epinard = Ingredient.create(name:'épinards');
haricot_vert = Ingredient.create(name:'haricots vert');
laitue = Ingredient.create(name:'laitue');
oignon = Ingredient.create(name:'oignon');
panais = Ingredient.create(name:'panais');
poireau = Ingredient.create(name:'poireau');
petit_pois = Ingredient.create(name:'petit pois');
poivron = Ingredient.create(name:'poivron');
potiron = Ingredient.create(name:'potiron');
radis = Ingredient.create(name:'radis');
rhubarbe = Ingredient.create(name:'rhubarbe');
salsifis = Ingredient.create(name:'salsifis');
topinambour = Ingredient.create(name:'topinambour');

#Sauces et huiles
sauce_soya = Ingredient.create(name:'sauce soya');
sauce_huitre = Ingredient.create(name:"sauce d'huitres");
huile_olives = Ingredient.create(name:"huile d'olives");
huile_amande = Ingredient.create(name:"huile d'amande");
huile_tournesol = Ingredient.create(name:'huile de tournesol');
huile_sesame = Ingredient.create(name:'huile de sésame');
huile_canola = Ingredient.create(name:'huile de canola');
huile_coco = Ingredient.create(name:'huile de coco');
vinaigre = Ingredient.create(name:'vinaigre');
vinaire_riz = Ingredient.create(name:'vinaire de riz');
mirin = Ingredient.create(name:'mirin');


##RECIPES
gratin_courgettes = Recipe.create(
  title: 'Gratin de courgettes',
  description: 'Un bon gratin de courgettes!',
  instruction: '1-Emincer les oignons. 2-Les faire fondre dans le beurre. 3-Râper 4 courgettes avec leur peau. 4-Les ajouter aux oignons. 5-Préchauffer le four à 200°C (thermostat 6-7). 6-Mélanger le gruyère râpé, les oeufs, la crème fraîche, puis saler et poivrer. 7-Mettre les courgettes dans un plat et verser par dessus la sauce et faire à four chaud pendant 15 min.',
  image: 'https://assets.afcdn.com/recipe/20190529/93185_w600.jpg'
)

##UNITIES
ml = Unity.create(unity: "ml")

##QUANTITIES
q_one = Quantity.create(quantity: 1)

##RECIPE_INGREDIENTS
recipe_gratin_courgettes = RecipeIngredient.create(
  recipe_id: gratin_courgettes.id,
  ingredient_id: courgette.id,
  unity_id: ml.id,
  quantity_id: q_one.id
)
recipe_gratin_courgettes_two = RecipeIngredient.create(
  recipe_id: gratin_courgettes.id,
  ingredient_id: gruyere.id,
  unity_id: ml.id,
  quantity_id: q_one.id
)
