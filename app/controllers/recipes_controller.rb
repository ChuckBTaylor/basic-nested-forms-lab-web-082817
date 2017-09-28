class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save ? (redirect_to @recipe) : (render :new)
  end


  private

  def recipe_params
    params.require(:recipe).permit(:title, ingredient_names:[:name, :quantity])
  end
end
