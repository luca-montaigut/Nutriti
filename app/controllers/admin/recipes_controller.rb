class Admin::RecipesController < Admin::ApplicationController
  before_action :set_admin_recipe, only: [:show, :edit, :update, :destroy]

  # GET /admin/recipes
  # GET /admin/recipes.json
  def index
    @admin_recipes = Admin::Recipe.all
  end

  # GET /admin/recipes/1
  # GET /admin/recipes/1.json
  def show
  end

  # GET /admin/recipes/new
  def new
    @admin_recipe = Admin::Recipe.new
  end

  # GET /admin/recipes/1/edit
  def edit
  end

  # POST /admin/recipes
  # POST /admin/recipes.json
  def create
    @admin_recipe = Admin::Recipe.new(admin_recipe_params)

    respond_to do |format|
      if @admin_recipe.save
        format.html { redirect_to @admin_recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @admin_recipe }
      else
        format.html { render :new }
        format.json { render json: @admin_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/recipes/1
  # PATCH/PUT /admin/recipes/1.json
  def update
    respond_to do |format|
      if @admin_recipe.update(admin_recipe_params)
        format.html { redirect_to @admin_recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_recipe }
      else
        format.html { render :edit }
        format.json { render json: @admin_recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/recipes/1
  # DELETE /admin/recipes/1.json
  def destroy
    @admin_recipe.destroy
    respond_to do |format|
      format.html { redirect_to admin_recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_recipe
      @admin_recipe = Admin::Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def admin_recipe_params
      params.fetch(:admin_recipe, {})
    end
end
