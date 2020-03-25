class Users::BreakfastController < Users::ApplicationController
  before_action :set_users_breakfast, only: [:show, :edit, :update]

  def show
    @meal = Breakfast.find(params[:id])
    @alim_groups = Food.all.map(&:alim_group).uniq
  
  end

  def edit
    @hotdrinks = Recipe.all.where(category: "Hot Drink")
    @fruits = Recipe.all.where(category: "Juice")
    @cereals = Recipe.all.where(category: "Cereal (Breakfast)")
    @proteins = Recipe.all.where(category: "Protein (Breakfast)")
    @options = Recipe.all.where(category: "Option (Breakfast)")
  end

  def update
    respond_to do |format|
      if @users_breakfast.update(users_breakfast_params)
        @users_breakfast.total_kcal
        format.html { redirect_to @users_breakfast, notice: "Petit dej mis à jours avec success" }
      else 
        format.html { redirect_to :edit, error: "Petit dej non mis à jours" }
      end
    end
  end



  private
    def set_users_breakfast
      @users_breakfast = current_user.breakfast
    end

    def users_breakfast_params
      params.fetch(:users_breakfast, {})
    end
end
