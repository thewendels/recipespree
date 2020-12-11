class Api::RecipeTagsController < ApplicationController
  before_action :authenticate_user

  def create
    tag_name = params[:tag_name]
    recipe = Recipe.find(params[:recipe_id])
    # or maybe it's the current recipe
    recipe.tags.find_or_create_by(name: tag_name)
    render 'show.json.jb'
  end

  def destroy
    @recipe.tag = RecipeTag.find(params[:id])

    @recipe_tag.destroy
    render json: {message: "Recipe tag successfully deleted!"}
  end
end
