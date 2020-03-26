class Admin::DashboardController < Admin::ApplicationController
  def index
    @recipes = Recipe.all 
    @foods = Food.all
    @users = User.all
  end
end
