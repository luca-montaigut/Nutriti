class Users::RecipesController < Users::ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
    @user_ratio = params[:ratio].to_f

    respond_to do |format|
      format.js {}
    end

  end
end
