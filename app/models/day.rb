class Day < ApplicationRecord
  after_create :create_day

  has_many :join_meal_days
  has_many :meal, through: :join_meal_days

  private

  def create_day
    JoinMealDay.create(meal_name: "breakfast", day_id: self.id, meal_id: Meal.all.sample.id)
    JoinMealDay.create(meal_name: "dinner", day_id: self.id, meal_id: Meal.all.sample.id) 
    JoinMealDay.create(meal_name: "supper", day_id: self.id, meal_id: Meal.all.sample.id)
  end
end
