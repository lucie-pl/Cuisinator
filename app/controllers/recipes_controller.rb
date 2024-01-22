class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    # ri = @recipe.recipe_ingredients.build
    # ri.build_quantity
    # ri.build_unity
    # ri.build_ingredient

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
# TODO: have the new.html.erb give this controller:
# ingredient_attributes, quantity_attributes and unity_attributes.
# Until then, use this combined with the private functions in
# recipe_ingredients model to workaround the issue.
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
        ingredients: [:name],
        quantities: [:quantity],
        unities: [:unity]
      ]
    )
  end
end
