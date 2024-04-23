class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  def index
    @recipes = Recipe.all
    render json: @recipes
  end

  # def show
  #   render json: @recipe
  # end

  def new
    @recipe = Recipe.new
    recipe_ingredient = @recipe.recipe_ingredients.build
    recipe_ingredient.build_ingredient(params[:recipe_ingredients_attributes])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was succesfully created'
      # render json: @recipe, status: :created, location: @recipe
    else
      # render :new
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipe_path(@recipe)
      # render json: @recipe
    else
      # render :edit
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe.destroy
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :title,
      :description,
      :image,
      instructions_attributes: [
        :step,
        :instruction,
      ],
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
