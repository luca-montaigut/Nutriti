class Meal < ApplicationRecord
  after_create :total_kcal
  has_many :join_meal_days
  belongs_to :starter, class_name: 'Recipe'
  belongs_to :dish, class_name: 'Recipe'
  belongs_to :dessert, class_name: 'Recipe'
  belongs_to :drink, class_name: 'Recipe'
  belongs_to :complement, class_name: 'Recipe'


  def generate(category)
    recipes = Recipe.all
    foods = Food.all
    if category == "Dish"
      self.category = "Dish"
    else 
      self.category = "Dinner"
    end

    self.starter_id = recipes.where(category: "Starter").sample.id
    self.dish_id = recipes.where(category: "Dish").sample.id
    self.dessert_id = recipes.where(category: "Dessert").sample.id
    self.drink_id = recipes.where(category: "Drink").sample.id # Eau minérale
    self.complement_id = recipes.where(category: "Complement").sample.id # Pain

    return self
  end

  private
  def total_kcal
    self.update(kcal: self.starter.total_kcal + self.dish.total_kcal + self.dessert.total_kcal + self.drink.total_kcal + self.complement.total_kcal)
  end
end
