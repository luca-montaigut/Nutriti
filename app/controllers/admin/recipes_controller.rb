class Admin::RecipesController < Admin::ApplicationController
  before_action :set_admin_recipe, only: [:show, :edit, :update, :destroy]

  # GET /admin/recipes
  # GET /admin/recipes.json
  def index
    @admin_recipes = Recipe.all

	respond_to do |format|
	  format.html
	  format.csv { send_data @admin_recipes.recipes_to_csv }
	end
  end

  # GET /admin/recipes/1
  # GET /admin/recipes/1.json
  def show
  end

  # GET /admin/recipes/new
  def new
    @admin_recipe = Recipe.new
    @admin_recipe.join_recipe_foods.build
  end

  # GET /admin/recipes/1/edit
  def edit
  end

  # POST /admin/recipes
  # POST /admin/recipes.json
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

  # PATCH/PUT /admin/recipes/1
  # PATCH/PUT /admin/recipes/1.json
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

  # DELETE /admin/recipes/1
  # DELETE /admin/recipes/1.json
  def destroy
    @admin_recipe.join_recipe_foods.destroy_all
    @admin_recipe.destroy
    respond_to do |format|
      format.html { redirect_to admin_recipes_url, notice: 'Recipe was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_recipe
      @admin_recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_recipe_params
      params
      .require(:recipe)
      .permit(:title, :forhowmany, :cookingtime, :category, :budget, :url, join_recipe_foods_attributes: [:food_id, :quantity, :_destroy])
    end

end
