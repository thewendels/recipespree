class Api::RecipeTagsController < ApplicationController
  before_action :authenticate_user

  def create
    tag_name = params[:tag_name]
    # if tag = Tag.find_by(name: tag_name)
    #   tag_id = tag.id
    # else
    #   tag = Tag.create({
    #     name: params[:tag_name]
    #   })
    #   tag_id = tag.id
    # end

    tag = Tag.find_or_create_by(name: tag_name)

    recipe = Recipe.find(params[:recipe_id])
    recipe.tags.find_or_create_by(name: tag_name)

    # { tag_name: 'Entree', recipe_id: 2, recipe_name: 'Chicken' }

    # find the Chicken recipe, or maybe it's this.currentRecipe
    # find the tags in the recipe
    # push something onto the recipe tags array with tag_name 'Entree'

    # if it just returns a new updated version of the recipe, then...
    # this.currentRecipe = newRecipe, or something like that, and all the data is structured right for rendering

    @recipe_tag = RecipeTag.new({
      recipe_id: params[:recipe_id],
      tag_id: tag.id
    }),
    if recipe_tag.save
      #tbd - make a json view that shows id, recipe_id, recipe.name, tag_id, tag.name
    else
      render json: { errors: @recipe_tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    #simple destroy
  end
end
