class Api::RecipeTagsController < ApplicationController
  before_action :authenticate_user

  # Adding a tag to a recipe
  def create
    # User enters the name of the tag
    tag_name = params[:tag_name]
    # They're on a specific recipe when they do this (current_recipe)
    @recipe = Recipe.find(params[:recipe_id])
    # We want to look up the tag_name that was entered to see if it exists. If it does, we want to grab that tag_id. If it doesn't, we want to create that tag and get its new tag_id.
    @tag = Tag.find_or_create_by(name: tag_name, user_id: current_user.id)
    @recipe_tag = RecipeTag.new({
      recipe_id: @recipe.id,
      tag_id: @tag.id
    })
    if @recipe_tag.save
      @recipe = Recipe.find(params[:recipe_id])
      render 'show.json.jb'
    else
      render json: { errors: @recipe_tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Taking a tag off of a recipe
  def destroy
    @recipe_tag = RecipeTag.find_by(recipe_id: params[:recipe_id], tag_id: params[:tag_id])
    @recipe_tag.destroy
    @recipe = Recipe.find(params[:recipe_id])
    render 'show.json.jb'
  end
end
