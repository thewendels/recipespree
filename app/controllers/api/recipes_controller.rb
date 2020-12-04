class Api::RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
    render 'index.json.jb'
  end

  def create
    @recipe = Recipe.new({
      name: params[:name],
      source: params[:source],
      recipe_url: params[:recipe_url],
      servings: params[:servings],
      total_prep_time: params[:total_prep_time],
      intro: params[:intro],
      ingredients: params[:ingredients],
      instructions: params[:instructions],
      notes: params[:notes],
      image_url: params[:image_url]
    })
    if @recipe.save
      render 'show.json.jb'
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @recipe = Recipe.find_by(id: params[:id])
    render 'show.json.jb'
  end

end
