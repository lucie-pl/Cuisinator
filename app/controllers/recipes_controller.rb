class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # before_update :mark_recipe_ingredient_for_destruction

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    recipe_ingredient = @recipe.recipe_ingredients.build
    recipe_ingredient.build_ingredient(params[:recipe_ingredients_attributes])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was succesfully created'
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])

  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to @recipe
  end

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
        :unity,
        :_destroy,
        { ingredient_attributes: %i[name ingredient_id] }
      ]
    )
  end
end
