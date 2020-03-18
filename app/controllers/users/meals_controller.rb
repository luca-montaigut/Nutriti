class Users::MealsController < Users::ApplicationController
  before_action :set_meal, only: [:show, :edit, :update, :destroy]

  # GET /users/meals
  # GET /users/meals.json
  def index
    @meals = Meal.all
  end

  # GET /users/meals/1
  # GET /users/meals/1.json
  def show
  end

  # GET /users/meals/new
  def new
    @meal = Meal.new
  end

  # GET /users/meals/1/edit
  def edit
  end

  # POST /users/meals
  # POST /users/meals.json
  def create
    @meal = Meal.new.generate("Dish")

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Meal was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/meals/1
  # PATCH/PUT /users/meals/1.json
  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Meal was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/meals/1
  # DELETE /users/meals/1.json
  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Meal was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_meal
      @meal = Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def meal_params
      params.fetch(:meal, {})
    end
end
