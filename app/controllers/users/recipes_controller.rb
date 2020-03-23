class Users::RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @user_ratio = params[:ratio].to_f
  end
end
