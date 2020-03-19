class Meal < ApplicationRecord
  after_create :total_kcal

  belongs_to :starter, class_name: 'Recipe'
  belongs_to :dish, class_name: 'Recipe'
  belongs_to :dessert, class_name: 'Recipe'
  belongs_to :drink, class_name: 'Recipe'
  belongs_to :complement, class_name: 'Recipe'

  has_many :breakfast_days, foreign_key: 'breakfast_id', class_name: 'Day'
  has_many :lunch_days, foreign_key: 'lunch_id', class_name: 'Day'
  has_many :dinner_days, foreign_key: 'dinner_id', class_name: 'Day'


  def generate(category)

    if category == "Breakfast"
      self.category = "Breakfast"
    elsif category == "Lunch"
      self.category = "Lunch"
    else category == "Diner"
      self.category = "Dinner"
    end

    self.starter = Recipe.all.where(category: "Starter").sample
    self.dish_id = Recipe.all.where(category: "Dish").sample.id
    self.dessert_id = Recipe.all.where(category: "Dessert").sample.id
    self.drink_id = Recipe.all.where(category: "Drink").sample.id # Eau minérale
    self.complement_id = Recipe.all.where(category: "Complement").sample.id # Pain

    return self
  end

  private
  def total_kcal
    self.update(kcal: self.starter.for_one + self.dish.for_one + self.dessert.for_one + self.drink.for_one + self.complement.for_one)
  end
end
