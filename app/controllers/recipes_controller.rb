class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    ri = @recipe.recipe_ingredients.build
    ri.build_quantity
    ri.build_unity
    ri.build_ingredient

  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
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
