class Users::MealsController < Users::ApplicationController
  before_action :set_meal, only: [:show, :update, :destroy]

  def index
    @meals = Meal.all
  end

  def show
    @meal = Meal.find(params[:id])
    @alim_groups = Food.all.map(&:alim_group).uniq
  end

  def create
    category = ['Lunch','Dinner']
    @meal = Meal.new.generate(category.sample, current_user)

    respond_to do |format|
      if @meal.save
        format.html { redirect_to @meal, notice: 'Votre repas a bien été créé.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @meal.update(meal_params)
        format.html { redirect_to @meal, notice: 'Votre repas a bienété mis à jours.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @meal.destroy
    respond_to do |format|
      format.html { redirect_to meals_url, notice: 'Votre repas a bien été supprimé.' }
    end
  end

  private
    def set_meal
      @meal = Meal.find(params[:id])
    end

    def meal_params
      params.fetch(:meal, {})
    end
end
