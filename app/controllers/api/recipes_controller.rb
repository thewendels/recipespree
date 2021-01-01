class Api::RecipesController < ApplicationController
  before_action :authenticate_user

  def index
    @recipes = Recipe.where(user_id: current_user.id).order(id: :desc)
    
    search = params[:search]
    if search
      search_terms = search.split(" ").each do |search_term|
        @recipes = @recipes.where("name ILIKE ? OR ingredients ILIKE ? OR instructions ILIKE ? or notes ILIKE ?", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%", "%#{search_term}%")
      end
    end

    render 'index.json.jb'
  end

  def create
    @recipe = Recipe.new({
      user_id: current_user.id,
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

  def scrape
    url = params[:url]
    parsed_object = Recipe.get_nokogiri_object(url)
    recipe_schema = Recipe.find_recipe_schema(parsed_object)
    site_name = Recipe.find_site_name(parsed_object)
    #error handling - did this work, is it nil?, if nil render some JSON and get out of here, call "return if recipe == nil" to get out of method
    transformed_recipe = Recipe.transform_recipe(recipe_schema, site_name, url)
    transformed_recipe[:user_id] = current_user.id
    @recipe = Recipe.new(transformed_recipe)
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
