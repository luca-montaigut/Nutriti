class Admin::RecipesController < Admin::ApplicationController
  before_action :set_admin_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @admin_recipes = Recipe.all
	@join_recipes = JoinRecipeFood.all
    @categories = ["Starter", "Dish", "Dessert", "Drink", "Complement"]
    respond_to do |format|
      format.html
      format.csv { send_data @join_recipes.join_to_csv }
    end
  end

  def show
  end

  def new
    @admin_recipe = Recipe.new
    @admin_recipe.join_recipe_foods.build
  end

  def edit
  end

  def create
    @admin_recipe = Recipe.new(admin_recipe_params)

    respond_to do |format|
      if @admin_recipe.save
        format.html { redirect_to admin_recipes_path, notice: 'Recipe was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @admin_recipe.join_recipe_foods.destroy_all
    respond_to do |format|
      if @admin_recipe.update(admin_recipe_params)
        format.html { redirect_to admin_recipes_path, notice: 'Recipe was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @admin_recipe.join_recipe_foods.destroy_all
    @admin_recipe.destroy
    respond_to do |format|
      format.html { redirect_to admin_recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private
    def set_admin_recipe
      @admin_recipe = Recipe.find(params[:id])
    end

    def admin_recipe_params
      params
      .require(:recipe)
      .permit(:title, :forhowmany, :cookingtime, :category, :budget, :url, join_recipe_foods_attributes: [:food_id, :quantity, :_destroy])
    end

end
