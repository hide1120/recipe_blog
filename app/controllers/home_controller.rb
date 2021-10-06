class HomeController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end
end
