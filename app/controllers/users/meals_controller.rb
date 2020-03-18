class Users::MealsController < Users::ApplicationController
  before_action :set_users_meal, only: [:show, :edit, :update, :destroy]

  # GET /users/meals
  # GET /users/meals.json
  def index
    @users_meals = Users::Meal.all
  end

  # GET /users/meals/1
  # GET /users/meals/1.json
  def show
  end

  # GET /users/meals/new
  def new
    @users_meal = Users::Meal.new
  end

  # GET /users/meals/1/edit
  def edit
  end

  # POST /users/meals
  # POST /users/meals.json
  def create
    @users_meal = Users::Meal.new(users_meal_params)

    respond_to do |format|
      if @users_meal.save
        format.html { redirect_to @users_meal, notice: 'Meal was successfully created.' }
        format.json { render :show, status: :created, location: @users_meal }
      else
        format.html { render :new }
        format.json { render json: @users_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/meals/1
  # PATCH/PUT /users/meals/1.json
  def update
    respond_to do |format|
      if @users_meal.update(users_meal_params)
        format.html { redirect_to @users_meal, notice: 'Meal was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_meal }
      else
        format.html { render :edit }
        format.json { render json: @users_meal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/meals/1
  # DELETE /users/meals/1.json
  def destroy
    @users_meal.destroy
    respond_to do |format|
      format.html { redirect_to users_meals_url, notice: 'Meal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_meal
      @users_meal = Users::Meal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_meal_params
      params.fetch(:users_meal, {})
    end
end
