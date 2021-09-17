class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end
  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "レシピが投稿されました"
      redirect_to @recipe
    else
      render "new"
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:warning] = "レシピが上書きされました"
      redirect_to @recipe
    else
      render "edit"
    end
  end


    private
      def recipe_params
        params.require(:recipe).permit(
          :title,
          :description,
          :mainvisual,
          :serves
        )
      end
end
