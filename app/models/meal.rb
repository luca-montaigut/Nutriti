class Meal < ApplicationRecord
  belongs_to :starter, class_name: 'Recipe'
  belongs_to :dish, class_name: 'Recipe'
  belongs_to :dessert, class_name: 'Food'
  belongs_to :drink, class_name: 'Food'
  belongs_to :complement, class_name: 'Food'


  def generate(type)
    recipes = Recipe.all
    foods = Food.all
    if type == "Dish"
      self.type = "Dish"
    else 
      self.type = "Dinner"
    end

    self.starter = recipes.where(type: "Starter").sample
    self.dish = recipes.where(type: "Dish").sample
    self.dessert = recipes.where(type: "Dessert").sample
    self.drink = recipes.where(type: "Drink") # Eau minérale
    self.complement = recipes.where(type: "Complement") # Pain

    return self
  end
end
