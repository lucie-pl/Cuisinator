class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.recipe_ingredients.build
  end

  def create
    @recipe = Recipe.new(recipe_params)
    # @recipe.id = params[:recipe_ingredient_id]
    if @recipe.save
      ing = Ingredient.create(name: params[:recipe][:ingredients][:name])
      q = Quantity.create(quantity: params[:recipe][:quantities][:quantity])
      u = Unity.create(unity: params[:recipe][:unities][:unity])

      @recipe.recipe_ingredients.create(
          recipe_id: @recipe.id,
          ingredient_id: ing.id,
          unity_id: u.id,
          quantity_id: q.id
        )
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
        :quantity_id,
        :unity_id,
        ingredient_attributes: [:name],
        quantity_attributes: [:quantity],
        unity_attributes: [:unity]
      ]
    )
  end
end
