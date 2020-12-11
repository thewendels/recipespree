class Api::RecipesController < ApplicationController
  before_action :authenticate_user

  def index
    @recipes = Recipe.all.order(id: :desc)
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
    @recipe = Recipe.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.name = params[:name] || @recipe.name
    @recipe.source = params[:source] || @recipe.source
    @recipe.recipe_url = params[:recipe_url] || @recipe.recipe_url
    @recipe.servings = params[:servings] || @recipe.servings
    @recipe.total_prep_time = params[:total_prep_time] || @recipe.total_prep_time
    @recipe.intro = params[:intro] || @recipe.intro
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.instructions = params[:instructions] || @recipe.instructions
    @recipe.notes = params[:notes] || @recipe.notes
    @recipe.image_url = params[:image_url] || @recipe.image_url

    if @recipe.save
      render 'show.json.jb'
    else 
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end

  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy
    render json: {message: "Recipe successfully deleted!"}
  end

end
