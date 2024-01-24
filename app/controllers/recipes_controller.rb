class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @r_i = @recipe.recipe_ingredients.build
    @r_i.build_ingredient(params[:recipe_ingredients_attributes])

  end

  def create
    @recipe = Recipe.new(recipe_params)
    debugger
    #params[:recipe][:recipe_ingredients_attributes].each do |ri_params|
    #  ing = Ingredient.create(name: ri_params[:ingredients][:name])

    #@recipe.recipe_ingredients[0].recipe_id = ing
    
    if @recipe.save
      # # q = Quantity.create(quantity: params[:recipe][:quantities][:quantity])
      # # u = Unity.create(unity: params[:recipe][:unities][:unity])
      # @recipe.recipe_ingredients.create(
      #   recipe_id: @recipe.id,
      #   ingredient_id: ing.id,
      #   unity: params[:recipe][:unity],
      #   quantity: params[:recipe][:quantity]
      # )
      redirect_to @recipe, notice: 'Recipe was succesfully created'
    else
      render :new
    end
  end

  # def edit
  # end

  # def update
  # end

  # def destroy
  # end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :description,
      :instruction,
      :image,
      recipe_ingredients_attributes: [
        :id,
        :recipe_id,
        :ingredient_id,
        :quantity,
        :_destroy,
        :unity,
        ingredients: [:name]
      ]
    )
  end
end
