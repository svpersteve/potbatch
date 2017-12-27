class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show, :edit, :update]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = @recipe.errors.full_messages.join(', ')
      render :new
    end
  end

  def index
    @recipes = Recipe.all
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      flash.now[:alert] = @recipe.errors.full_messages.join(', ')
      render :edit
    end
  end

  private

  def recipe_params
    params.require(:recipe)
          .permit(:title,
                  :description,
                  :ingredients,
                  :preparation,
                  :directions,
                  :image_url,
                  :prep_time,
                  :cooking_time,
                  :serves)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end
end
