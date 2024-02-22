class RecipeIngredientsController < ApplicationController

  def show
    @recipe_ingredient = RecipeIngredient.find(params[:recipe_ingredients[3]])
  end

  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:recipe_ingredients[3]])
    @recipe_ingredient.destroy
  end

  private

  # def set_recipe_ingredient
  #   @recipe_ingredient = RecipeIngredient.find(params[:id])
  # end

end
