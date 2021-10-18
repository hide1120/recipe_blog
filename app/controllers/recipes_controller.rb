class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end
  def new
    @recipe = Recipe.new
    @recipe_ingredients = @recipe.recipe_ingredients.build
    #@how_to_makes = @recipe.how_to_makes.build
  end
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "レシピが投稿されました"
      redirect_to @recipe
    else
      flash.now[:danger] = "レシピの投稿に失敗しました"
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
   # @recipe_ingredients = @recipe.recipe_ingredients
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @recipe_ingredients = @recipe.recipe_ingredients.build
  end
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:warning] = "レシピが上書きされました"
      redirect_to @recipe
    else
      flash.now[:danger] = "レシピの更新に失敗しました"
      render "edit"
    end
  end


    private
      def recipe_params
        params.require(:recipe).permit(
          :title,
          :description,
          :mainvisual,
          :serves,
          recipe_ingredients_attributes: [:id, :ing_name, :quantity, :_destroy]
          #how_to_makes_attributes:[:id, :explanation, :process_image, :order_no, :_destroy]
        )
      end
end
