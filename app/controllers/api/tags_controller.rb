class Api::TagsController < ApplicationController

  def index
    @tags = Tag.all.order(name: :asc)
    render 'index.json.jb'
  end
  
  # def create
  #   @tag = Tag.new({
  #     name: params[:name]
  #   })
  #   if @tag.save
  #     render 'show.json.jb'
  #   else
  #     render json: { errors: @tag.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  def show
    @tag = Tag.find(params[:id])
    render 'show.json.jb'
  end

  def update
    @tag = Tag.find(params[:id])

    @tag.name = params[:name] || @tag.name

    if @tag.save
      render 'show.json.jb'
    else 
      render json: { errors: @tag.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @tag = Tag.find(params[:id])

    @tag.destroy
    render json: {message: "Tag successfully deleted!"}
  end

end
